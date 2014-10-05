Rails.application.routes.draw do
  devise_for :users
  resources :clients do
    collection do
      get :sign_in
      post :getQuestion
      post :upvoteQuestion
      post :downvoteQuestion

    end
  end
  resources :users do
    resources :boards do
      resources :messages 
    end
  end

  root 'welcome#index'

  get '/' => 'welcome#index'



end
