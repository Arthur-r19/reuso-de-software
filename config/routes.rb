Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "authentication#index"

  get 'authentication/sign_in', to: 'authentication#sign_in'
  post 'authentication/sign_in', to: 'authentication#login'
  get 'authentication/sign_up', to: 'authentication#sign_up'
  post 'authentication/sign_up', to: 'authentication#create'
  delete 'authentication/logout', to: 'authentication#logout'

  get 'player', to: 'player#index'
  get 'study', to: 'study#study'
  post 'study', to: 'player#study'
  get 'challenge', to: 'challenge#challenge'
  post 'challenge', to: 'player#challenge'

end
