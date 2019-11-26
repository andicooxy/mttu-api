Rails.application.routes.draw do
  resources :offenders
  resources :offenses
  resources :regions , only: [:index] 
  resources :departments , only: [:index] 
  resources :users do 
    collection do 
      get "summary"
    end
  end

  post 'profile/login', to: 'generals#login'
  get 'v1/reports', to: 'generals#reports'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
