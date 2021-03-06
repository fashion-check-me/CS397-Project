Rails.application.routes.draw do

  devise_for :users
  get '/users', to: 'users#index'
  get '/users/:username', to: 'users#show', as: :user_profile
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landing#index'

  post '/search/search', to: 'search#search'
  get '/search', to: 'search#index'

  resources :tags
  resources :takedowns
  resources :comments
  resources :outfits
  put 'outfits/:id/upvote' => 'outfits#vote_up', as: 'outfit_vote_up'
  put 'outfits/:id/downvote' => 'outfits#vote_down', as: 'outfit_vote_down'
  put 'outfits/:id/report' => 'outfits#report', as: 'outfit_report'

  get 'admin' => 'admin#index', as: 'admin'
  get 'admin/reported' => 'admin#reported', as: 'review_reported'
  put 'admin/unflag/:id' => 'admin#unflag', as: 'unflag_outfit'
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
