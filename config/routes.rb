Rails.application.routes.draw do
  root 'pages#home'
  resources :issues
  resources :stories
  resources :products do
    collection { post :sort }
  end
  resources :friend_products do
    collection { post :sort }
  end

  resource :cart, only: [:show, :destroy] do
    post "add", path: "add/:id", on: :member
    delete "remove", path: "destroy/:id", on: :member
    # get :checkout
  end
  # post '/add_to_cart' => 'carts#add_to_cart', as: 'add_to_cart'
  # post '/remove_from_cart' => 'carts#remove_from_cart', as: 'remove_from_cart'

  get '/admin' => 'pages#admin', as: 'admin'
  get '/store' => 'pages#store', as: 'store'

  resource :session, controller: 'clearance/sessions', only: [:create]
  get    '/sign_in'  => 'clearance/sessions#new',     as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
end
