Rails.application.routes.draw do

devise_for :users

root to: 'welcome#index'
get 'welcome/about'
get 'downgrade' => 'users#downgrade'

resources :wikis
resources :charges, only: [:new, :create]

end
