Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_for :admins, skip: [:registrations]

  resources :profiles, only: :show

  namespace :admin do 
    root to: "home#index"
    resources :admins
    resources :users, only: :index
    resources :posts, only: [:index, :show, :destroy, :edit]
  end

   root to: "user/timeline#index"

  namespace :user do
    get "profile", to: "profile#show"
    get 'potential_to_follow', to: "profile#potential_to_follow"
    get 'following', to: "profile#following"
    get 'followers', to: "profile#followers"
    resources :posts, only: [:create, :destroy] do 
      member do
        post :like_toggle
      end
    end

    resources :comments, only: [:create, :destroy]
    
    post 'follow/:id', to: "subscriptions#follow", as: :follow
    delete 'unfollow/:id', to: "subscriptions#unfollow", as: :unfollow

  end
end
