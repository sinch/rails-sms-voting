Rails.application.routes.draw do
  root "votes#index"
  post 'vote' => 'votes#create'

  resources :submissions, only: [:new, :create, :index]
end
