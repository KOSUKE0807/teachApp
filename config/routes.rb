Rails.application.routes.draw do

  resources :messages, only: [:new, :create]

#   変更点は反映されておりますでしょうか  
  get 'charts/index'

  post 'scores/create', to: 'scores#create'
  

  get 'scores/create'

  get 'scores/destroy'

  get 'stu_login', to: 'sessions#login_form'

  post 'stu_login', to: 'sessions#create'
  delete 'stu_logout', to: 'sessions#destroy'

  get 'students/show(/:id)', to: 'students#show'
  
  get 'mypage/:id', to: 'students#mypage'

  devise_for :teachers
  root 'top#home'

 

  post 'episodes/create'
  
  resources :tests
  resources :teachers_accounts
  resources :episodes
  resources :scores
  resources :students, only: [:new ,:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

 # https://fierce-reaches-09141.herokuapp.com/hello/index