Rails.application.routes.draw do
  devise_for :users
  root to: 'cases#index'
  get '/security', to: 'cases#security'

  resources :cases do
    get 'closed', on: :collection
    resources :sections
    get '/security', to: 'sections#security'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
