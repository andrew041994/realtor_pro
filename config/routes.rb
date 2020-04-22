Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :users do 
    resources :properties do 
      resources :clients
    end
  end
  resources :companies
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
