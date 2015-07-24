Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :products do
      resources :skus
    end
  end
end
