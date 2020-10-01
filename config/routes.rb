Rails.application.routes.draw do
  root 'home#top'
  devise_for :users,
  controllers: { registrations: 'registrations' }

  
  
  resources :users, :only => [:index, :show] do
    member do
      get :followings, :followers
     end
  end
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  resources :posts, only: %i(new create index show edit destroy update) do
    collection do
      get :like_ranking
      get :search
    end
    resource :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
    resources :recipes, only: %i(new index show create destroy)
    resources :materials, only: %i(create destroy)
    resources :items, only: %i(create destroy)
    resources :orders, only: %i(new create) do
      member do
        get :confirm
        get :thanks
      end
    end
  end
  
  post '/home/guest_sign_in', to: 'home#new_guest'
  resources :relationships, only: %i(create destroy index)
  resources :notifications, only: %i(index)
  delete "/destroy_all" => "notifications#destroy_all", as: "destroy_all_users_notifications"
end
