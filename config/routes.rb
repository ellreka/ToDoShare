Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :todos
  root 'todos#index'
  get '/:twitter_id' => 'todos#mypage'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'todos#index'

<<<<<<< HEAD

=======
>>>>>>> 7b8834edfb3a81da7049fc54be695ac0c5d39dc3
end
