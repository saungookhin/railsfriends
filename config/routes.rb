Rails.application.routes.draw do
  devise_for :users
  resources :railsfriends
  get 'home/index'
  get 'home/about'
  get 'home/contact1'
  #get 'contact1'
  #root 'home#index' #localhost:3000
  root 'railsfriends#index'
  #get '*home', to: 'home#index', format: true
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
