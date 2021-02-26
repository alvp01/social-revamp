Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  post 'users/:id/follow', to: 'users#follow', as: 'follow_user'
  post 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'
  get '/users', to: 'users#index'
  get '/:username', to: 'users#show', as: "user"
  resources :posts, only: %i[new create destroy] do
    resources :comments, only: %i[new create destroy]
  end
  resources :discussions, only: %i[new create destroy] do
    resources :comments, only: %i[new create destroy]
  end

  resources :groups, only: %i[new create destroy show]
  post 'groups/:id/join', to: 'groups#join', as: 'group_join'
  post 'groups/:id/leave', to: 'groups#leave', as: 'group_leave'

  root to: 'users#index'
end
