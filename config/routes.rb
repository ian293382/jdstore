Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
#admin
    namespace :admin do

      resources :products do

        member do
          patch :move_up
          patch :move_down
        end
      end


        resources :orders do
          member do
            post :cancel
            post :ship
            post :shipped
            post :return
          end

      end
    end
#admin part
    resources :products do
      collection do
        get :search
      end
        member do
          post :add_to_cart
          post :add_to_favorite
          post :remove_to_favorite
        end
    end
# products
      resources :carts do
           collection do
             delete :clean
             post :checkout
           end
         end
# carts

#account
  namespace :account do
    resources :orders
  end

     resources :cart_items

     resources :orders do
        member do
          post :pay_with_alipay
          post :pay_with_wechat
          post :apply_to_cancel
        end
     end
<<<<<<< HEAD
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :news

  namespace :owner do
    resources :news
  end
=======
#favorites part
     resources :favorites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> collection
end
