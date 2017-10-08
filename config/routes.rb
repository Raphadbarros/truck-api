Rails.application.routes.draw do
  resources :shipments
  resources :vehicles
  resources :truckers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
