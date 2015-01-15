Rails.application.routes.draw do

  root 'welcome#index'

  resources :organizations
  resources :keywords

end
