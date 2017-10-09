Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do 

    resources :truckers, only: [:create, :update, :last_location, :index, :show] do
      collection do
        put ":id/last_location", to: "truckers#last_location"
      end

    end
    
    resources :shipments, only: [:show, :create, :narby_truckers] do
      collection do
        get ":id/nearby_truckers", to: 'shipments#narby_truckers'
      end

    end
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
