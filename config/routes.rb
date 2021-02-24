Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  post 'users/:id/follow', to: 'users#follow', as: 'follow_user'
  post 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'
  resources :users, only: %i[index show]
  resources :posts do
    resources :comments
  end

  root to: 'users#index'
end
