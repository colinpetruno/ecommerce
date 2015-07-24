Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :products do
      resources :skus
    end
  end

  resources :products, only: [:show] do
    resources :order_items, only: [:create]
  end
end
