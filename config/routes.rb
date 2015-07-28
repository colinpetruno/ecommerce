Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :categories
    resources :products do
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
  end

  resources :products, only: [:show] do
    resources :order_items, only: [:create]
  end
end
