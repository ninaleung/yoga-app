Rails.application.routes.draw do
  devise_for :users
  get '/' => 'pages#index'
  get '/yoga_classes' => 'yoga_classes#index'
  get '/yoga_classes/new' => 'yoga_classes#new'
  post'/yoga_classes/' => 'yoga_classes#create'
  get '/yoga_classes/:id' => 'yoga_classes#show'
  get '/yoga_classes/:id/edit' => 'yoga_classes#edit'
  patch '/yoga_classes/:id' => 'yoga_classes#update'
  delete '/yoga_classes/:id' => 'yoga_classes#destroy'

  get '/studios' => 'studios#index'
  get '/studios/new' => 'studios#new'
  post'/studios/' => 'studios#create'
  get '/studios/:id' => 'studios#show'
  get '/studios/:id/edit' => 'studios#edit'
  patch '/studios/:id' => 'studios#update'
  delete '/studios/:id' => 'studios#destroy'

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
