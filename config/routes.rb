Rails.application.routes.draw do
  root 'pages#home'

  get '/contents' => 'pages#contents', as: 'contents'
  get '/example' => 'pages#example', as: 'example'
end
