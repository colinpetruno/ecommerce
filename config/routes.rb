require "resque_web"

Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  mount ResqueWeb::Engine => "/resque_web"

  namespace :admin do
    get "/" => "dashboards#show"

    resources :categories do
      resources :images, only: [:new, :create, :destroy]
    end

    resources :coupons,
      only: [ :create, :destroy, :edit, :index, :new, :update ]

    resources :orders, only: [:index, :show]
    resources :page_views, only: [:index, :show]
    resources :products do
      resources :images, only: [:new, :create, :destroy]
      resources :skus
    end
  end

  scope module: "store" do
    root to: 'pages#show', id: 'home'

    namespace :cart do
      resource :abandoned_cart, only: :create
    end

    resources :categories, only: [:index, :show]

    namespace :checkout do
      resources :shipping_forms,
        only: [:new, :create],
        path: :shipping
      resources :credit_cards,
        only: [:new, :create],
        path: :billing
      resources :order_confirmations,
        only: [:new, :create],
        path: :review
    end

    resources :email_subscribers, only: [:create]

    resources :products, only: [:show, :index] do
      resources :order_items, only: [:create, :update, :destroy]
    end
  end
end
