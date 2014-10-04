Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :boards do
      resources :messages 
    end
  end
  
  root 'welcome#index'

  get '/' => 'welcome#index'



end
