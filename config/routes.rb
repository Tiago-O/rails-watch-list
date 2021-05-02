Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # # user can see all the lists
  # get 'lists', to: 'lists#index'

  # # user can create a new list
  # get 'lists/new', to: 'lists#new'
  # post 'lists', to: 'lists#create'

  # # user can see the details of a given list and its name
  # get 'lists/:id', to: 'lists#show'

  resources :lists, except: [:edit, :update, :destroy] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
