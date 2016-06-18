Rails.application.routes.draw do
  devise_for :users
  root "pages#about"
  get 'pages/about'

end
