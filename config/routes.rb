PlanYourCe::Application.routes.draw do
  root to: 'pages#welcome'

  resources :providers, only: [:new, :create] do
    resources :courses, controller: 'providers/courses'
  end

  resources :courses, only: [:index, :show]

  get '/providers/dashboard'
  get '/dashboard', to: 'dashboard#index'

  get '/thank_you', to: 'pages#thank_you'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'

  resources :courses, only: [:index, :show]

  namespace :admins do
    get '/dashboard'
    scope 'providers' do
      get ':scope', to: 'providers#index', as: 'providers_scoped',
        constraints: { scope: /(all|unapproved|approved)/ }
      post ':provider_id/approve', to: 'providers#approve', as: :approve_provider
      post ':provider_id/reject', to: 'providers#reject', as: :reject_provider
      get ':provider_id/confirm_reject', to: 'providers#confirm_reject', as: :confirm_reject
    end
  end

end
