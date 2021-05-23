Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'

  devise_for :corps, controllers: {
    sessions:       'corps/sessions',
    passwords:      'corps/passwords',
    registrations:  'corps/registrations'
  }
  resources :corps, only: [:show]
  get 'follows', to: 'corps#follows'
  get 'corp/about', to: 'corps#about'
  get 'corp/mypage', to: 'corps#mypage'
  get 'corp/search', to: 'corps#search'

  devise_for :users, controllers: {
    sessions:       'users/sessions',
    passwords:      'users/passwords',
    registrations:  'users/registrations'
  }
  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
  end
  get 'user/mypage', to: 'users#mypage'
  get 'user/about', to: 'users#about'
  get 'user/followers', to: 'users#follow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  resources :suggests
  resources :notifications, only: [:index, :destroy]
  delete 'delete', to: 'notifications#destroy_all'
  #resources :relationships, only: [:create, :destroy]
  post 'relationships/follow', to: 'relationships#follow'
  resources :rooms, only: [:show, :index]
  resources :messages, only: [:create, :destroy]
  resources :posts, only: [:new,:create,:show,:edit,:update,:destroy]
end
