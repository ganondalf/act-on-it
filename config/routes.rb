Rails.application.routes.draw do

  root 'welcome#index'

  resources :organizations,  only: [ :query, :read ]
  resources :keywords

end
