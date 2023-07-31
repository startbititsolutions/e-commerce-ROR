Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  
  #resources :vendors
  #resources :admin_users, only: [:edit, :update,:show]

devise_for :users
  #resources :productdetails
  #resources :products
  

  root to: "home#index"
  get '/products', to: 'products#index'
  get '/products/:id', to: 'products#show', as: :product
  get 'product_vendor/:vendor_id', to: 'products#product_vendor', as: 'product_vendor'


  namespace :admin do
    resources :admin_users, only: [:edit, :update,:show]
    resources :vendors
    root to: 'admin#index' 
    resources :productdetails, only: [:index, :show, :edit, :update] do
      get 'page/:page', action: :index, on: :collection, as: 'page'
  
      delete 'delete_image/:image_id', action: :delete_image, on: :member, as: :delete_image
      
    end
  end
 
end
