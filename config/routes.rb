Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  namespace :customer do
  resources :items, only: [:index, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
  resources :cart_items, only: [:index, :update, :destroy, :all_destroy, :create]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
end 
  namespace :admin do
  resources :sessions, only: [:new, :create, :destroy]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show]
  get "/home/about" => "homes#about" , as: "about"
  get "/admin" => "homes#top" , as: "admin"
end
end 