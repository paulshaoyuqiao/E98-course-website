Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post 'import', to: 'autograder#import'

  resources :sessions, only: [:create, :destroy]
  resource :course, only: [:home]

  root to: 'course#home'
end