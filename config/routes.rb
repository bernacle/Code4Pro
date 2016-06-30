Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'},
             controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root "project#index"
  get '/myprojects' => 'project#list'
  get 'pages/about'
  post '/free' => 'charge#free'

  resources :project do
    resources :task, only: [:show]
  end

end
