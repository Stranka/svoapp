RailsNuke::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :translations

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
      post 'send_email'
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

  match 'mail/:id' => 'articles#email', :as => :email
    
  root :to => "articles#show_content", :id => 9
end
