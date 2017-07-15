Rails.application.routes.draw do
  root 'pages#home'
  resources :issues
  resources :stories
  resources :friend_products do
    collection { post :sort }
  end

  get '/admin' => 'pages#admin', as: 'admin'

  resource :session, controller: 'clearance/sessions', only: [:create]
  get    '/sign_in'  => 'clearance/sessions#new',     as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
end
