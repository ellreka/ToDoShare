Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :likes, only: [:create, :destroy]
  end
  root 'todos#index'
  get '/:twitter_id', to: 'todos#mypage'
  
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  root 'todos#index'
  
end
