Socialnetworks::Application.routes.draw do
  root to: 'main#index'

  match '/auth/facebook/callback', to: 'facebook#create'
  match '/auth/twitter/callback', to: 'twitter#create'
  match '/auth/github/callback', to: 'github#create'
  match 'google/authenticate', to: 'google#authenticate'

  match 'oauth2authorize', to: 'google#oauth2authorize'
  match 'oauth2callback', to: 'google#oauth2callback'

  match 'auth/failure', to: 'facebook#failure'
  match 'signout', to: 'sessions#destroy', as: 'signout'

  match 'facebook', to: 'facebook#index', as: 'facebook'
  match 'twitter', to: 'twitter#index', as: 'twitter'
  match 'github', to: 'github#index', as: 'github'
  match 'google', to: 'google#index', as: 'google'

  match 'googlemaps', to: 'position#index', as: 'positions'
  match 'position/save', to: 'position#save', as: 'save_position'
  match 'position/delete/:id', to: 'position#delete', as: 'delete_position'

  match 'github/delete_gist/:id', to: 'github#delete_gist', as: 'delete_gist'

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
