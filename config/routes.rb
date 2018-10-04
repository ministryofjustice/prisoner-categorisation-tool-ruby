Rails.application.routes.draw do
  devise_for :users
  root to: 'cases#index'

  resources :cases do
    get 'closed', on: :collection
    get '/security', to: 'cases#security'

    (1..6).each do |n|
      get "section_#{n}", on: :member
    end

    resources :sections
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
