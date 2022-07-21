Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'home/about', to: 'homes#about', as: 'home_about'

  resources :users,only:[:show,:edit,:index,:update]
  resources :books,only:[:new,:index,:show,:create,:edit,:destroy,:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
