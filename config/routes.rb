Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  devise_for :users,
  controllers: { registrations: 'registrations' }

  root 'home#top'
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end
end
