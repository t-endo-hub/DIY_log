Rails.application.routes.draw do
  root 'home#top'
  post '/home/guest_sign_in', to: 'home#new_guest'


  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'    
  end

  namespace :admins do
    resources :users, only: %i(index show destroy)
  end
  
  
  devise_for :users,
  controllers: { registrations: 'registrations' }
  
  namespace :users do
    resources :users, :only => [:index, :show] do
      member do
        get :followings, :followers
      end
    end
    resources :messages, :only => [:create]
    resources :rooms, :only => [:create, :show, :index]
    
    resources :posts, only: %i(new create index edit destroy update) do
      collection do
        get :like_ranking
        get :search
        
      end      

      resource :likes, only: %i(create destroy)
      resources :comments, only: %i(create destroy)
      resources :recipes, only: %i(new index show create update destroy)
      resources :materials, only: %i(create destroy)
      resources :items, only: %i(create destroy)
      resources :orders, only: %i(new create) do
        member do
          get :confirm
          get :thanks
        end
      end
    end
    
    resources :categories, except: [:new, :show]
    resources :relationships, only: %i(create destroy index)
    resources :notifications, only: %i(index)
    delete "/destroy_all" => "notifications#destroy_all", as: "destroy_all_users_notifications"
  end
  resources :categories, except: [:new, :show] do
    member do
      get :category_posts
    end
  end
end
