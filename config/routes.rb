Rails.application.routes.draw do

 root to: 'welcome#index'
    get 'welcome/about'

end