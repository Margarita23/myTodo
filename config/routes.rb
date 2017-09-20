Rails.application.routes.draw do
  devise_for :users
  resources :project, only: [:create, :update, :destroy, :set_priority] do
    resources :tasks, only: [:create, :update, :destroy] do
    end
  end
  root 'project#index'
  post '/drag-tasks/', to: 'project#set_priority', as: :set_prioritys
end
