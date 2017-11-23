Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "events#index"
  resources :events do
    resources :recordings, only: [:create, :destroy]
  end
  resources :tags, only: [:show]
end
