Rails.application.routes.draw do

  
  resources :orders

  devise_for :customers
  mount Ckeditor::Engine => '/ckeditor'
  
  
  #resources :vendors
  #resources :admin_users, only: [:edit, :update,:show]

devise_for :users
resources :coupons

  #resources :productdetails
  #resources :products
  
 resources :customer_profile, only: [:edit,:update,:show]
 get 'my_orders', to: 'orders#index_for_current_customer', as: 'my_orders'
  root to: "home#index"
  get '/products', to: 'products#index'
  get '/products/:id', to: 'products#show', as: :product
  get 'product_vendor/:vendor_id', to: 'products#product_vendor', as: 'product_vendor'
  get '/blog', to: 'products#blog'
  get '/contact', to: 'products#contact'
  get 'carts/:id', to: 'carts#show', as:"cart"
  delete 'carts/:id', to: 'carts#destroy'
  post 'apply_discount', to: 'carts#apply_discount'
  post 'remove_discount', to: 'carts#remove_discount'

 get 'line_items/:id/add', to: 'line_items#add_quantity', as: "line_item_add"
get 'line_items/:id/reduce', to: 'line_items#reduce_quantity', as: "line_item_reduce"
post 'line_items', to: 'line_items#create'
get 'line_items/:id', to: 'line_items#show', as: "line_item"
delete 'line_items/:id', to: 'line_items#destroy'
post  'line_items/:id', to: 'line_items#update_quantity'
 get 'checkout', to: 'checkouts#show'
 get 'success', to: 'checkouts#success'
 get   'failuer', to: 'checkouts#failuer'
 get     'billing', to: 'billing#show'


  namespace :admin do
    resources :coupons
    resources :admin_users, only: [:edit, :update,:show]
    resources :vendors
    resources :orders
    resources :discounts do
      member do
        post 'toggle_status'
      end
    end
    root to: 'admin#index' 
    resources :productdetails, only: [:index, :show, :edit, :update] do
      get 'filter_by_vendor', on: :collection
      get 'page/:page', action: :index, on: :collection, as: 'page'
  
      delete 'delete_image/:image_id', action: :delete_image, on: :member, as: :delete_image
    
    end


  end 
 
end
