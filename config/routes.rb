Rails.application.routes.draw do
  get 'pages/index'

  resources :vehicles

  resources :users do
    collection do
      get :search
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'vehicles#new'
end
