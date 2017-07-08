Rails.application.routes.draw do
  root 'pages#home'
  resources :issues

  get '/example' => 'pages#example', as: 'example'
end
