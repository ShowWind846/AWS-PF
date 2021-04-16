Rails.application.routes.draw do
  devise_for :corps, controllers: {
    sessions:       'corps/sessions',
    passwords:      'corps/passwords',
    registrations:  'corps/registrations'
  }

  devise_for :users, controllers: {
    sessions:       'users/sessions',
    passwords:      'users/passwords',
    registrations:  'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  get 'about',to: 'homes#about'
  get 'mypage',to: 'homes#mypage'
  resources :suggests
  #resources :relationships, only: [:create, :destroy]
  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
  end
  post 'relationships/follow', to: 'relationships#follow'
  get 'corps/favos', to: 'corps#favos'

end
