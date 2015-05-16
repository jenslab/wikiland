Rails.application.routes.draw do

devise_for :users

root to: 'welcome#index'
get 'welcome/about'

resources :wikis
resources :charges, only: [:new, :create]

end
