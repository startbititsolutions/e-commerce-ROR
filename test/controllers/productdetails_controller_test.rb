require "test_helper"

class ProductdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productdetail = productdetails(:one)
  end

  test "should get index" do
    get productdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_productdetail_url
    assert_response :success
  end

  test "should create productdetail" do
    assert_difference('Productdetail.count') do
      post productdetails_url, params: { productdetail: { brand: @productdetail.brand, description: @productdetail.description, list_price: @productdetail.list_price, meta_description: @productdetail.meta_description, meta_title: @productdetail.meta_title, price: @productdetail.price, product_title: @productdetail.product_title, product_type: @productdetail.product_type, sku: @productdetail.sku, status: @productdetail.status, tags: @productdetail.tags, vendor_id: @productdetail.vendor_id } }
    end

    assert_redirected_to productdetail_url(Productdetail.last)
  end

  test "should show productdetail" do
    get productdetail_url(@productdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_productdetail_url(@productdetail)
    assert_response :success
  end

  test "should update productdetail" do
    patch productdetail_url(@productdetail), params: { productdetail: { brand: @productdetail.brand, description: @productdetail.description, list_price: @productdetail.list_price, meta_description: @productdetail.meta_description, meta_title: @productdetail.meta_title, price: @productdetail.price, product_title: @productdetail.product_title, product_type: @productdetail.product_type, sku: @productdetail.sku, status: @productdetail.status, tags: @productdetail.tags, vendor_id: @productdetail.vendor_id } }
    assert_redirected_to productdetail_url(@productdetail)
  end

  test "should destroy productdetail" do
    assert_difference('Productdetail.count', -1) do
      delete productdetail_url(@productdetail)
    end

    assert_redirected_to productdetails_url
  end
end
