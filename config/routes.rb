Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'sessions' }, :skip => :registrations
  devise_for :admins, :skip => :sessions
  devise_for :managers, :skip => :sessions
  devise_for :technicians, :skip => :sessions
  devise_for :secretaries, :skip => :sessions
  devise_for :clients, :skip => :sessions
  resources :users
  resources :break_products

  resources :reports do
    resources :costs
    resources :inspections
  end
  resources :brands
  resources :categories
  resources :locations
  get '/about', to: 'welcome#about'
  get '/services', to: 'welcome#service'
  get '/faq', to: 'welcome#faq'
  resources :products do
    patch :add_quantity, on: :member
  end
  root 'welcome#home'
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
