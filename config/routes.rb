Rails.application.routes.draw do
  with_options defaults: { format: :json } do
    # sideload
    namespace :v1 do
      resources :posts, only: %i(index show)
    end

    # embedded object
    namespace :v2 do
      resources :posts, only: %i(index show)
    end

    # reference with ids
    namespace :v3 do
      resources :posts, only: %i(index show)
      resources :comments, only: %i(index show)
    end

    # resources with links
    namespace :v4 do
      resources :posts, only: %i(index show) do
        resources :comments, only: %i(index)
      end
    end

    # CRUD
    namespace :v5 do
      resources :posts, only: %i(index show)
      resources :comments, only: %i(create destroy)
    end
  end
end
