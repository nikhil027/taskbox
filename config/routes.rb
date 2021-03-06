Rails.application.routes.draw do

  
  #resources :bookings
  resources :rooms do
    resources :bookings
  end
  get '/sandbox/mtrzomato'
  get '/sandbox/zomato'
  get 'sandbox/get_jobs'
  get 'sandbox/get_restaurants'
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :clients
    end
  end

  get '/clients/export_client_details'
  get '/clients/export'
  get '/tasks/mark_as_incomplete'
  get '/tasks/mark_as_complete'
  devise_for :users
  resources :projects
  resources :clients
  resources :tasks
  get 'sandbox/clients'

  get 'sandbox/projects'

  get 'sandbox/products'
  get 'say/listing_products'
  get 'say/goodbye'
  get 'say/hello'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'projects#index'

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
