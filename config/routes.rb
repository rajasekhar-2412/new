<<<<<<< HEAD
BookmarkApplication::Application.routes.draw do
  resources :categories

  get "site/index"
  get "site/about"
  devise_for :users
  resources :bookmarks
  resource :categories

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'site#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
=======
MyProject::Application.routes.draw do
  devise_for :users
   # root :to => new_user_registration_path
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
>>>>>>> 4a8ce979fa08b275175a00818938acf83923a916
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

<<<<<<< HEAD
  # Example resource route with sub-resources:
=======
   resources :trains do
     # member do
       get 'show_my_account'
     # end
   end
     # resources :trains do
       # member do
         # get 'new'
         # post 'create'
       # end
#        
       # collection do
#          
       # end
     # end
  # Sample resource route with sub-resources:
>>>>>>> 4a8ce979fa08b275175a00818938acf83923a916
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

<<<<<<< HEAD
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
=======
  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
>>>>>>> 4a8ce979fa08b275175a00818938acf83923a916
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
<<<<<<< HEAD
=======

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  
  devise_scope :user do 
    root :controller => "devise/registrations", :action=>"new" 
     end 
  # root :controller => "devise/registrations", :action=>"new"  
  # root :to => "devise/registrations", :action=>"new"
  # devise_scope :user do match "/some/route" => "some_devise_controller" end 
  # :controller => "login",:action => "login"
  # root :to =>"welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
>>>>>>> 4a8ce979fa08b275175a00818938acf83923a916
end
