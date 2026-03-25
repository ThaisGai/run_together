Rails.application.routes.draw do
  resources :runs

  devise_for :users
  root to: "pages#home"

  get "my_runs", to: "runs#my_runs", as: :my_runs

  resources :chats, only: [:index, :show] do
    resources :messages, only: [:create]
  end
  get "chats/with/:user_id", to: "chats#with_user", as: "chat_with_user"

  get "up" => "rails/health#show", as: :rails_health_check
end
