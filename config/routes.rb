Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "events#index"
  resources :events
  resources :tags, only: [:show]
end
