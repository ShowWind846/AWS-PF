Rails.application.routes.draw do
  devise_for :corps, controllers: {
    sessions:       'corps/sessions',
    passwords:      'corps/passwords',
    registrations:  'corps/registrations'
  }
  resources :corps, only: [:show]
  get 'favorites', to: 'corps#favos'
  get 'corp/about', to: 'corps#about'
  get 'corp/mypage', to: 'corps#mypage'

  devise_for :users, controllers: {
    sessions:       'users/sessions',
    passwords:      'users/passwords',
    registrations:  'users/registrations'
  }
  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
  end
  get 'user/mypage', to: 'users#mypage'
  get 'user/about', to: 'users#about'
  get 'user/followers', to: 'users#follow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  get 'about',to: 'homes#about'
  resources :suggests
  resources :notifications, only: [:index]
  delete 'delete', to: 'notifications#destroy_all'
  #resources :relationships, only: [:create, :destroy]
  post 'relationships/follow', to: 'relationships#follow'
  resources :rooms, only: [:index,:show]
  resources :messages, only: :create
end
