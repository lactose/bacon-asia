BaconAsia::Application.routes.draw do
  root to: 'questions#new', via: :get

  resources :questions do
    put :upvote, to: 'questions#upvote', as: 'upvote'
  end
  resources :answers
end
