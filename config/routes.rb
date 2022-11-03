Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers do
      end
      resources :subscriptions do
      end
      resources :customer_subscriptions do
      end
    end
  end
end
