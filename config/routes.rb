Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :categories
    resources :products do
      resources :images, only: [:new, :create, :destroy]
      resources :skus
    end
  end

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
