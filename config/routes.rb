Rails.application.routes.draw do
  devise_for :users,
   controllers: { registrations: 'registrations' }
  root 'posts#index'
  resources :users
  resources :posts do
    resources :photos
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
