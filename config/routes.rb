Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  resources :registrations, only: %i[new create]

  resources :tasks

  root "tasks#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
