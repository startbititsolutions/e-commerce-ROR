Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  
  #resources :vendors
  resources :admin_users, only: [:edit, :update,:show]

devise_for :users
  #resources :productdetails
  #resources :products
  

  root to: "home#index"
  namespace :admin do
   
    resources :vendors
    root to: 'admin#index' 
    resources :productdetails, only: [:index, :show, :edit, :update] do
      get 'page/:page', action: :index, on: :collection, as: 'page'
  
      delete 'delete_image/:image_id', action: :delete_image, on: :member, as: :delete_image
      
    end
  end
 
end
