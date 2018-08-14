Rails.application.routes.draw do
  resources :todos do
    resources :likes, only: [:create, :destroy]
  end
  get '/:twitter_id', to: 'todos#mypage'
  get '/:twitter_id/likes', to: 'todos#likes'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'todos#index'
end
