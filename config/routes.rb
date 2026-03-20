Rails.application.routes.draw do
  resources :runs

  devise_for :users
  root to: "pages#home"

  get "my_runs", to: "runs#my_runs", as: :my_runs

  get "up" => "rails/health#show", as: :rails_health_check
end
