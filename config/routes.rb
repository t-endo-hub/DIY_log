Rails.application.routes.draw do
  get 'home/top'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  devise_for :users,
  controllers: { registrations: 'registrations' }

  root 'posts#index'
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  resources :posts, only: %i(new create index show edit destroy) do
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
    resources :recipes, only: %i(new index show edit create destroy)
    resources :materials, only: %i(create destroy)
    resources :items, only: %i(create destroy)
  end
  resources :relationships, only: %i(create destroy index)
  resources :notifications, only: %i(index)
  delete "/destroy_all" => "notifications#destroy_all", as: "destroy_all_users_notifications"
end
