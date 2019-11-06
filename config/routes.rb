Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
    root to:  'posts#index'
   
   get 'signup', to: 'users#new'
    resources :users, only: [:index, :show, :new, :create]
    resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
