Rails.application.routes.draw do
  get 'pokemons/index'
  get 'pokemons/show'
  root to: 'pages#home'
  resources :pokemons, only: [:index, :show]
end
