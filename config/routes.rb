Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :vendors
  resources :admin_users, only: [:edit, :update,:show]

  #resources :productdetails
  #resources :products
  
  resources :productdetails, only: [:index, :show, :edit, :update] do
    get 'page/:page', action: :index, on: :collection, as: 'page'

    delete 'delete_image/:image_id', action: :delete_image, on: :member, as: :delete_image
    
  end
  root to: "home#index"
 # delete 'productdetails/:id/delete_image/:image_id', to: 'productdetails#destroy_image', as: :delete_image_productdetail
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
