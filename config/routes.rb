Rails.application.routes.draw do
  root "orders#index"

  resources :orders do
    collection do
      post :download, :defaults => { :format => 'xlsx' }
    end
  end
  resources :executors
  resources :service_categories do
    resources :services
  end
end
