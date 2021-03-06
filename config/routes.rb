Rails.application.routes.draw do
  root to: 'pages#home'
  get '/users/:user_id/cheap_properties', :to => 'properties#cheap_properties'
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :users do 
    resources :properties, except: [:index] do 
      resources :clients , only: [:new, :create, :show]
    end
  end
  resources :companies, only: [:create]
  match '*any', via: :get, to: 'application#not_found'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
