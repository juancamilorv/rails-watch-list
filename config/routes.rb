Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/new'
  get 'lists/create'
  get 'lists/index'
  get 'lists/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # List
  get '/lists', to: 'lists#index', as: :lists
  get '/lists/new', to: 'lists#new', as: :new_list
  post '/lists', to: 'lists#create'
  get '/lists/:id', to: 'lists#show', as: :list

  # Bookmark
  get 'lists/:list_id/bookmarks/new', to: 'bookmarks#new', as: :new_list_bookmark
  post 'lists/:list_id/bookmarks/', to: 'bookmarks#create', as: :list_bookmarks
  delete 'bookmarks/:id', to: 'bookmarks#destroy'
end
