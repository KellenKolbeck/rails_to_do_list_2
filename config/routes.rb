Rails.application.routes.draw do
  root :to => "lists#index"
  
  resources :lists do
    resources :tasks
  end

  resources :tasks do
    resources :subtasks
  end
end
