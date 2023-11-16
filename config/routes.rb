Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:new, :show, :edit, :update, :destroy]
  resources :movies, only: [:index, :show] do
    resources :bookmarks, only: [:new, :create] do
      collection do
        get :new_from_movies
      end
      end
      end
    end
