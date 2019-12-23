Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#index'
  resources :user_sessions, only: %i[new create destroy]
  resources :users, only: %i[show new edit create update] do
    resources :links, only: %i[index show new create] do
      resources :visits, only: :index
      get 'browsers' => 'visits#browsers'
      get 'devices' => 'visits#devices'
    end
  end

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

  get ':slug' => 'redirects#go', as: :go
end
