BaconAsia::Application.routes.draw do
  root to: 'questions#new', via: :get

  resources :questions do
    put :upvote, to: 'questions#upvote', as: 'upvote'
    post :answer, to: 'questions#add_answer'
  end
  resources :answers do
    put :upvote, to: 'answers#upvote', as: 'upvote'
  end

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
