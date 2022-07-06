Rails.application.routes.draw do
  root "orders#index"

  resources :orders
  resources :executors
  resources :service_categories do
    resources :services
  end
end
