Rails.application.routes.draw do
  get 'home/top'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  devise_for :users,
  controllers: { registrations: 'registrations' }

  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(new create index show edit destroy) do
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
    resources :recipes, only: %i(new index show edit create destroy)
    resources :materials, only: %i(create destroy)
    resources :items, only: %i(create destroy)
  end
  resources :relationships, only: %i(create destroy)
end
