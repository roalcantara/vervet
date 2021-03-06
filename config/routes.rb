Rails.application.routes.draw do
  root 'posts#index'
  resources :users, except: :new
  scope '/auth' do
    get '/callback', to: 'auth0#callback', as: :callback_auth0
    get '/failure', to: 'auth0#failure', as: :failure_auth0
    get '/destroy', to: 'auth0#destroy', as: :destroy_auth0
  end
  resources :posts, only: [:index, :create, :destroy]
  get '/posts/new/:kind', to: 'posts#new', as: :new_post

  scope '/users' do
    get '/follow/:id', to: 'following#follow', as: :follow
    get '/unfollow/:id', to: 'following#unfollow', as: :unfollow
  end
end
