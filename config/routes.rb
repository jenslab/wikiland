Rails.application.routes.draw do

devise_for :users
match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

root to: 'welcome#index'
get 'welcome/about'
get 'downgrade' => 'users#downgrade'

resources :wikis do
  resources :collaborators, only: [:create, :destroy]
end

resources :charges, only: [:new, :create]
resources :users, only: [:index, :show]

end
