Rails.application.routes.draw do

  root "task_lists#index"

  get "signin" => "sessions#new", as: :signin

  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  get "/about" => "about#about", as: :about

  # get "/task_lists/new" => "task_lists#new"
  #
  # post "/task_lists" => "task_lists#create"
  #
  # get "/task_lists/:id/edit" => "task_lists#edit"
  #
  # put "/task_lists/:id" => "task_lists#update", as: :task_list
  #
  # patch "/task_lists/:id" => "task_lists#update"

  resources :task_lists do
    resources :tasks

  end
end
