require "resque_web"

Rails.application.routes.draw do
  devise_for :users

  mount ResqueWeb::Engine => "/resque_web"

  namespace :admin do
    get "/" => "dashboards#show"

    resources :categories
    resources :products do
      resources :images, only: [:new, :create, :destroy]
      resources :skus
    end
  end

  scope module: "store" do
    root to: 'pages#show', id: 'home'

    namespace :cart do
      get "/" => "orders#edit"
      resource :abandoned_cart, only: :create
    end

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

    resources :products, only: [:show] do
      resources :order_items, only: [:create]
    end
  end
end
