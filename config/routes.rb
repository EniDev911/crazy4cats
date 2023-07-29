Rails.application.routes.draw do
  resources :publications
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/reactions', to: 'reactions#user_reaction', as: 'user_reaction'

  # Defines the root path route ("/")
  # root "articles#index"
end
