BaconAsia::Application.routes.draw do
  https_options = { protocol: 'https' }

  root to: 'questions#new', via: :get

  resources :questions do
    put :upvote, to: 'questions#upvote', as: 'upvote'
    post :answer, to: 'questions#add_answer'
  end
  resources :answers do
    put :upvote, to: 'answers#upvote', as: 'upvote'
  end

  namespace :users do
    resource :account
  end

  scope https_options do
    match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    match 'auth/failure', to: redirect('/'), via: [:get, :post]
    match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  end
end
