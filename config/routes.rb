Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }

  root 'home#top'
  get '/users/:id', to: 'users#show', as: 'user'
end
