Rails.application.routes.draw do
  root 'posts#index'
  get    '/home',       to: 'posts#index'
  post   '/login',      to: 'sessions#create'
  get    '/login',      to: 'sessions#new'
  delete '/logout',     to: 'sessions#destroy'

  # Custom routes for verification upload
  put  '/verification/upload/:id', to: 'users#uploadVerification', as: 'verification_upload'
  get  '/verification/:id',        to: 'users#verification',   as: 'verification'
  get  '/verification/upload/:id', to: 'users#verification'

  # Custom routes for password update
  put  '/password/update/:id', to: 'users#updatePassword', as: 'password_update'
  get  '/password/update/:id', to: 'users#password'
  get  '/password/change/:id', to: 'users#password',  as: 'password_change'

  # Custom routes for avatar upload
  get  '/avatar/upload/:id',   to: 'users#avatar',    as: 'avatar_upload'
  put  '/avatar/update/:id',   to: 'users#updateAvatar', as: 'avatar_update'
  get  '/avatar/update/:id',   to: 'users#avatar'

  # Custom Routes for showing my comments, profile, posts and comments to me
  get  '/mycomments/:id',   to: 'users#mycomments',   as: 'mycomments'
  get  '/myprofile/:id',    to: 'users#myprofile',    as: 'myprofile'
  get  '/myposts/:id',      to: 'users#myposts',      as: 'myposts'
  get  '/commentstome/:id', to: 'users#commentstome', as: 'commentstome'

  # Custom routes to updating personal info 
  get    '/setting/:id',          to: 'users#setting',   as: 'setting'
  patch  '/userinfo/update/:id',  to: 'users#update',    as: 'userinfo_update'
  get    '/userinfo/update/:id',  to: 'users#setting'

  get  '/new',    to: 'users#new'
  get  '/users',  to: 'users#new'
  post '/users',  to: 'users#create'
  get  '/show',   to: 'users#show'
  get 'posts/:id/view_count', to: 'posts#view_count'
  get '/posts/filter/:filtertype', to: 'posts#filter_post', as: 'posts_filter'
  put '/topics/:id', to: 'topics#update', as: 'toggle_topic'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :posts do
    # Used for creating the comments inside a post
    resources :comments, only: [:create]
  end
  resources :topics, only: [:update]

end
