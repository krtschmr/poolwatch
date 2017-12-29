Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "application#index"
  get "/:address", to: "application#show", as: :address
end
