Rails.application.routes.draw do
  root "votes#index"
  post 'vote' => 'votes#create'
  get 'votes' => 'votes#votes'

  resources :submissions, only: [:new, :create, :index]
end
