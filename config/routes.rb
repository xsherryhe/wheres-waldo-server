Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#init'
  resources :images, only: %i[index] do
    resources :games, only: %i[index]
  end
  resources :games, only: %i[create update]
end
