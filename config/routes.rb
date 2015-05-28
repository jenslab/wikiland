Rails.application.routes.draw do

devise_for :users

root to: 'welcome#index'
get 'welcome/about'
get 'downgrade' => 'users#downgrade'

resources :wikis do
  resources :collaborators, only: [:create, :destroy]
end

resources :charges, only: [:new, :create]
resources :users, only: [:index, :show]

end
