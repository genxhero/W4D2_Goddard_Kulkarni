Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats 
  resources :cat_rental_requests do
    member do
      get "approve_request"
      get "deny_request"
    end
  end
  # resources :cat_rental_requests
end
