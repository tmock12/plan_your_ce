PlanYourCe::Application.routes.draw do
  root to: 'pages#welcome'

  resources :providers, only: [:new, :create]

  get '/thank_you', to: 'pages#thank_you'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
end
