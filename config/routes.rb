HnClone::Application.routes.draw do

  resources :posts do
    resources :comments
    resources :votes, only: [:create]
  end

  resources :users

  root to: 'posts#index'

end