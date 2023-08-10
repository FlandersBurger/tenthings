Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :legacy do
    get 'lists', action: :index, controller: 'lists'
    get 'users', action: :index, controller: 'users'
  end
  
  resources :lists, only: %i[index] do
    get 'random', on: :collection
  end
end
