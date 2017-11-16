Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "events#index"
  resources :events do
    resources :recordings, only: [:create]
  end
  resources :tags, only: [:show]
end
