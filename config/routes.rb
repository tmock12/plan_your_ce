PlanYourCe::Application.routes.draw do
  root to: 'pages#welcome'

  resources :providers, only: [:new, :create] do
    resources :courses
  end

  get '/provider_dashboard', to: 'providers#dashboard'
  get '/admin_dashboard', to: 'admins#dashboard'
  get '/dashboard', to: 'dashboard#index'

  get '/thank_you', to: 'pages#thank_you'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'

  resources :courses, only: [:index, :show]

end
