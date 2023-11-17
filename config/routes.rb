Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  resources :movies, only: [:index, :show] do
    resources :bookmarks, only: [:new, :create] do
    end
  end
end
