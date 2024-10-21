Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  resources :books, only: [:new, :index, :show]
  resources :users, only: [:show, :edit]
end
