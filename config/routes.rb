Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
  
  root to: "homes#top"
  get "/about" => "homes#about"
  get "/show" => "costomers#mypage"
  get "/edit" => "customers#information"
  get "/unsubscribe" => "customers#unsubscribe"
  patch "/withdrawal" => "customers#withdrawal"
  delete "/all_destroy" => "cart_items#all_destroy"
  post "/confirm" => "orders#comfirm"
  get "/complete" => "orders#complete"
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
  resources :cart_items, only: [:index, :update, :destroy, :all_destroy, :create]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  end 
  namespace :admin do
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show]
  root to: "homes#top"
  get "/" => "homes#top" 
end
end 