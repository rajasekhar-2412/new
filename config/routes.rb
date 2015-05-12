
BookmarkApplication::Application.routes.draw do
  resources :laboratories

  resources :libraries

  resources :assets

  resources :customs
  resources :profiles
  resources :categories
  resources :friendships do
    get :autocomplete_user_username, :on => :collection
  end

  get "site/index"
  get "site/about"
  devise_for :users
  resources :bookmarks
  resource :categories

  get 'create_friend', to: "friendships#create_friend"
  get 'delete_friend', to: "friendships#delete_friend"
  get 'update_friend', to: "friendships#update_friend"
  get 'friends', to: "friendships#friends"
  get 'search_friend', to: "friendships#search_friend"
  get 'delete_photo', to:"profiles#delete_photo"
  get 'notifications', to: "profiles#notifications"
  get 'show_friends_bookmarks', to:"profiles#show_friends_bookmarks"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'site#index'

  resources :conversations do
    resources :messages
  end

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
