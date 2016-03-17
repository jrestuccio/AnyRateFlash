Rails.application.routes.draw do
  
  # Current homepage/no authentication
  root 'static_pages#welcome'

  get 'static_pages/welcome', to: 'static_pages#welcome', as: 'welcome'
  post 'static_pages/welcome', to: 'static_pages#logon'

  get 'static_pages/:id/flash', to: 'static_pages#flash', as: 'flash'
  post 'static_pages/:id/flash', to: 'static_pages#continue'

  get 'static_pages/:id/flashRefineSearchRateTypes', to: 'static_pages#flashRefineSearchRateTypes', as: 'flashRefineSearchRateTypes'
  post 'static_pages/:id/flashRefineSearchRateTypes', to: 'static_pages#continue2'

  get 'static_pages/:id/flashRefineSearch', to: 'static_pages#flashRefineSearch', as: 'flashRefineSearch'
  post 'static_pages/:id/flashRefineSearch', to: 'static_pages#continue3'
  

  get 'static_pages/:id/flashRefineSearchSchedule', to: 'static_pages#flashRefineSearchSchedule', as: 'flashRefineSearchSchedule'
  post 'static_pages/:id/flashRefineSearchSchedule', to: 'static_pages#continue4'


  resources :tfx_contacts
  resources :tfx_hotels

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
