RailsNuke::Application.routes.draw do

  resources :tooltips do
             collection do
               get 'tooltip_content'
             end
           end

  resources :errors

  resources :payments

  resources :pictures


  resources :basketlines

  resources :baskets do
    collection do
      get 'show_my_open_order'
      get 'checkout'
      put 'checkout_step_1'
    end
    member do
      put 'add_to_basket'

    end
  end

  resources :customers

  resources :addresses

  resources :shipments

  resources :news do
    collection do
      get 'all_news'
    end
  end

  resources :products do
    collection do
      get 'show_products_productclass'
      get 'show_specification_sheet'
    end
    member do
      get 'product_detail'
      get 'product_detail_general'
    end
  end

  resources :productclasses do
    collection do
      get 'click'
      get 'up'
      get 'down'
    end
  end

  resources :articles do
    member do
      get 'permalink'
      get 'show_content'
    end
  end

  get "user_sessions/new"

  resources :menues do
    collection do
      get 'click'
      get 'up'
      get 'down'
      get 'change_language'
      get 'change_theme'
    end
  end

  resources :configurations
  resources :blocks
  resources :user_sessions
  resources :users

#  match 'baskets/:id/add_to_basket', :controller => 'baskets', :action => 'add_to_basket'
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout

  match 'articlesearch' => "articles#search_all"
  match 'productsearch' => "products#search_all"

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
  # root :to => "welcome#index"
  root :to => "articles#show_content", :id => 9
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

end

