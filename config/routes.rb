Rails.application.routes.draw do
  resources :posts
  resources :comments, only: %i(create update)

  namespace :v1 do
    resources :posts, only: %i(index show)
  end

  namespace :v2 do
    resources :posts, only: %i(index show)
  end
end
