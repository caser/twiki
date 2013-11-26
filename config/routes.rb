Twiki::Application.routes.draw do

  get "upgrade/show"

  post "upgrade/create"

  devise_for :users

  resources :users

  resources :wikis do
    resources :sections, only: [:create]
  end

  resources :sections, except: [:create]

  get "welcome/index"

  root to: "welcome#index"

end
