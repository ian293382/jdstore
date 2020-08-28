Rails.application.routes.draw do




get 'product_images/controller'



  devise_for :users
  root 'products#index'
   #--=== 前台 ===--#

  # 商品
      resources :products do
          member do
            post :add_to_cart
            post :add_to_favorite
            post :remove_to_favorite
          end
      end



  #購物車
        resources :carts do
             collection do
               delete :clean
               post :checkout
             end
           end

#訂單
  resources :orders do
     member do
       post :pay_with_alipay
       post :pay_with_wechat
       post :apply_to_cancel
     end
  end

#admin  後台
        namespace :admin do
#後台路由設定

          root 'sessions#new'
          resources :sessions

          #訂單order排列
            resources :orders do
              member do
                post :cancel
                post :ship
                post :shipped
                post :return
            end
          end

                  # 類型 #
            resources :category_groups do
              member do
                post :publish
                post :hide
              end
            end

              # 分類 #
              resources :categories do
                member do
                  post :publish
                  post :hide
                end
              end




                  resources :products do
                  #product_image (improve  web's_effect)
                    resources :product_images, only: [:index, :create, :destroy, :update]
                  #end


                  #member 移動功能
                  member do
                      patch :move_up
                      patch :move_down
                  end
                end


          end
          #admin part end




#account
  namespace :account do
    resources :orders
  end

     resources :cart_items




# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :news

  namespace :owner do
    resources :news
  end

#favorites part
     resources :favorites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#categories show
  resources :categories
end
