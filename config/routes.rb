Rails.application.routes.draw do

  namespace :admin do
      resources :products
    end

resources :products
  devise_for :users
  root 'products#index'
  resources :carts do
       collection do
         delete :clean
       end
     end

     resources :cart_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
