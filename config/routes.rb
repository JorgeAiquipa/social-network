Socialnetworks::Application.routes.draw do
  root to: 'main#index'

  match '/auth/facebook/callback', to: 'facebook#create'
  match 'auth/:provider/callback', to: 'facebook#koala'
  match 'auth/failure', to: 'facebook#failure'
  match 'signout', to: 'sessions#destroy', as: 'signout'

  match 'sayhello', to: 'facebook#sayhello', as: 'sayhello'
  match 'login', to: 'facebook#login', as: 'login'
  match 'test', to: 'facebook#test', as: 'test'
  match 'friends', to: 'facebook#friends', as: 'friends'
  match 'friends2', to: 'facebook#friends2', as: 'friends2'
  match 'serverside', to: 'facebook#serverside', as: 'serverside'
  match 'serversidesuccess', to: 'facebook#serversidesuccess', as: 'serversidesuccess'
  match 'koala', to: 'facebook#koala', as: 'koala'
  match 'facebook', to: 'facebook#index', as: 'facebook'

  #dark_zeratul64@hotmail.com

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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
