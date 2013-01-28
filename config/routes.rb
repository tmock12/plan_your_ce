PlanYourCe::Application.routes.draw do
  root to: 'pages#welcome'

  resources :providers, only: [:new, :create] do
    resources :courses, controller: 'providers/courses' do
      collection do
        get '/active', to: 'providers/courses#active'
        get '/inactive', to: 'providers/courses#inactive'
      end
    end
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
    resources 'providers', only: :index do
      post '/approve', to: 'providers#approve'
      post '/reject', to: 'providers#reject'
      get '/confirm_reject', to: 'providers#confirm_reject'
      collection do
        get '/unapproved'
        get '/approved'
      end
    end
  end

  get '/airports', to: 'airports#index'

end
