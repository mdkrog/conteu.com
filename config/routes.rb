Rails.application.routes.draw do
  root 'pages#home'

  get '/example' => 'pages#example', as: 'example'
end
