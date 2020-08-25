Rails.application.routes.draw do
  namespace :admin do
    get 'categories/index'
  end

  namespace :admin do
    get 'categories/new'
  end

  devise_for :users
  root 'products#index'
#admin
    namespace :admin do
      root 'sessions#new'
      resources :sessions
      #categories 分類
      resources :categories
        resources :products do
        #product_image (improve  web's_effect)
          resources :product_images, only: [:index, :create, :destroy, :update]


        #member
        member do
            patch :move_up
            patch :move_down
        end
      end

#order排列
        resources :orders do
          member do
            post :cancel
            post :ship
            post :shipped
            post :return
        end
      end
    end
#admin part end




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

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :news

  namespace :owner do
    resources :news
  end

#favorites part
     resources :favorites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#categories show
  resources :categories, only: [:show]
end
