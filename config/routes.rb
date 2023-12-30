Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users', to: 'registrations#create'
      post '/users/sign_in', to: 'sessions#create'

      # resources :packages, only: [:index, :show, :create, :update, :destroy] do
      #   resources :reservations, only: [:index, :create, :show, :destroy]
        resources :stocks, only: [:index, :show] do
      end

      get '/reservations', to: 'reservations#reservations'
    end
  end
end
