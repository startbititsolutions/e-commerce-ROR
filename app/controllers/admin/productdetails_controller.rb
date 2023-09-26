module Admin
  class ProductdetailsController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!  
    before_action :check_admin_role  

    def filter_by_vendor
      
      selected_vendors = params[:vendors] || [] 
      products = Productdetail.where(vendor_id: selected_vendors) 
  

      filtered_products = products.map { |product| { id: product.id, name: product.product_title } }
    
      render json: filtered_products
     end
 
    def index
      items_per_page = 10
      @current_page = (params[:page] || 1).to_i
      offset_value = (@current_page - 1) * items_per_page
      @q = Productdetail.includes(:vendor)
      apply_filters
      apply_sorting(params[:s]) if params[:s].present?
      apply_currency_filter(params[:currency]) if params[:currency].present?
      @search_results = @q
      total_records = @search_results.count
      @total_search_pages = (total_records.to_f / items_per_page).ceil #total number of required  search page
      @productdetails = @search_results.limit(items_per_page).offset(offset_value)
      @total_items = total_records
    end
    
    
    
    # GET /productdetails/1 or /productdetails/1.json
    def show
      @productdetails = Productdetail.friendly.find(params[:id])
      @image_urls = []
      
      if @productdetails.images.attached?
        @productdetails.images.each do |image|
          @image_urls << url_for(image)
        end
      end
    end
    
    # GET /productdetails/new
    def new
      @productdetail = Productdetail.new
      @vendors = Vendor.all # this is for vendor dropdown
    end


    # GET /productdetails/1/edit
    def edit
      @productdetail = Productdetail.find(params[:id])
      @vendors = Vendor.all

    end

    # POST /productdetails or /productdetails.json
    def create
      @productdetail = Productdetail.new(productdetail_params)

      respond_to do |format|
        if @productdetail.save
          format.html { redirect_to productdetail_url(@productdetail), notice: "Productdetail was successfully created." }
          format.json { render :show, status: :created, location: @productdetail }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @productdetail.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      @productdetail = Productdetail.find(params[:id])
      new_images = params[:productdetail][:images]  
      featured_image_id = params[:productdetail][:feature_image_id]
    
      # Set the featured_image_id if present
      @productdetail.feature_image_id = featured_image_id if featured_image_id.present?
    
      # Attach new images if present
      if new_images.present?
        new_images.each do |index, image_file|
          next unless image_file.present?
    
          if @productdetail.images[index.to_i].present?
            @productdetail.images[index.to_i].purge
            @productdetail.images.attach(image_file)
          else
            @productdetail.images.attach(image_file)
          end
        end
      end
    
      respond_to do |format|
        if @productdetail.update(productdetail_params)
          format.html { redirect_to admin_productdetail_url(@productdetail), notice: "Product detail was successfully updated." }
          format.json { render :show, status: :ok, location: @productdetail }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @productdetail.errors, status: :unprocessable_entity }
        end
      end
    end

    
    def delete_image
      @productdetail = Productdetail.find(params[:id])
      image = @productdetail.images.find(params[:image_id])
      image.purge # This will delete the image file from storage and the record from the database.
    
      redirect_to  edit_admin_productdetail_path(@productdetail), notice: "Image deleted successfully."

    end
     
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_productdetail
        @productdetail = Productdetail.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def productdetail_params
        params.require(:productdetail).permit(:product_title ,:brand, :price,  :list_price, :description, :sku, :tags, :product_type, :status, :meta_title, :meta_description, :vendor_id, :inventory, :currency, images: [])
      end
      def apply_filters
        if params[:product_title_or_vendor_first_name_cont].present?
          @q = @q.joins(:vendor).where("product_title LIKE ? OR vendors.first_name LIKE ?", "%#{params[:product_title_or_vendor_first_name_cont]}%", "%#{params[:product_title_or_vendor_first_name_cont]}%")
        end
      
        if params[:vendor_first_name_eq].present?
          @q = @q.joins(:vendor).where(vendors: { first_name: params[:vendor_first_name_eq] })
        end
      end
      
      
    
      def apply_sorting(sort_option)
        case sort_option
        when 'product_title asc'
          @q = @q.order(product_title: :asc)
        when 'product_title desc'
          @q = @q.order(product_title: :desc)
        when 'created_at asc'
          @q = @q.order(created_at: :asc)
        when 'created_at desc'
          @q = @q.order(created_at: :desc)
        when 'vendor_first_name asc'
          @q = @q.joins(:vendor).order('vendors.first_name ASC')
        when 'vendor_first_name desc'
          @q = @q.joins(:vendor).order('vendors.first_name DESC')
        when 'price asc'
          @q = @q.order(price: :asc)
        when 'price desc'
          @q = @q.order(price: :desc)
        end
      end
    
      def apply_currency_filter(currency)
        @q = @q.where(currency: currency)
      end
      def check_admin_role
        unless current_user.has_role?(:admin)
          redirect_to root_path, alert: "You must be an admin to access this page."
        end
      end
 end
end
