HnClone::Application.routes.draw do

	get 'log_out' => 'sessions#destroy', as: 'log_out'
  get 'newest' => 'newest#index'
	resources :sessions, only: [:index, :create, :destroy]

  resources :posts do
    resources :comments
    resources :votes, only: [:create]
  end

  resources :users, only: [:create]

  root to: 'posts#index'

end