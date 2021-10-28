Rails.application.routes.draw do
  get 'user/login', to: 'sessions#new'
  post 'user/login', to: 'sessions#create'
  delete 'user/logout', to: 'sessions#destroy'
 
  get 'rooms/index'
  get 'rooms/list'
  get 'rooms/search'
  
  get 'bookings/list'
  
  resource :user
  resources :rooms, only: [:index, :new, :create, :show]
  resources :bookings, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
