FavMe::Application.routes.draw do


  resources :friendships

  # Users
  # authenticated :user do
  #   root 'meetings#index'
  # end
  devise_scope :user do
    # resources :users, only: %w(show), constraints: { id: /\d+/ }
    get '/users/profile' => 'users#show'
    resources :users, only: 'show'
    # get '/users/auth/:provider/callback' => 'users/omniauth_callbacks#passthru'

    match 'users/fast_sign_up' => 'users/registrations#fast_sign_up', via: [:get, :post]
  end
  devise_for :users

  root 'site#home', as: 'home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
