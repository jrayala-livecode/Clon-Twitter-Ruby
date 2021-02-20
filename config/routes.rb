Rails.application.routes.draw do
  resources :tweets do
    resources :likes
  end

  devise_for :users
  post 'tweets/retweet'
  post 'tweets/retweet'
  root to: 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
