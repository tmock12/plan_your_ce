PlanYourCe::Application.routes.draw do
  root to: 'pages#welcome'

  resources :providers, only: [:new, :create] do
    resources :courses
  end

  get '/providers/dashboard'
  get '/dashboard', to: 'dashboard#index'

  get '/thank_you', to: 'pages#thank_you'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'

  resources :courses, only: [:index, :show]

  namespace :admins do
    get '/dashboard'
    post '/providers/:provider_id/approve', to: 'providers#approve'
    post '/providers/:provider_id/reject', to: 'providers#reject'
    get '/providers/:provider_id/confirm_reject', to: 'providers#confirm_reject'
  end

end
