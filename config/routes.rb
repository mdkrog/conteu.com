Rails.application.routes.draw do
  root 'pages#home'
  resources :issues
  resources :stories
  resources :orders, except: [:destroy]
  resources :products do
    collection { post :sort }
  end
  resources :friend_products do
    collection { post :sort }
  end

  resource :cart, only: [:destroy] do
    post "add", path: "add/:id", on: :member
    delete "remove", path: "destroy/:id", on: :member
  end

  get '/admin' => 'pages#admin', as: 'admin'
  get '/store' => 'pages#store', as: 'store'

  resource :session, controller: 'clearance/sessions', only: [:create]
  get    '/sign_in'  => 'clearance/sessions#new',     as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'

  scope 'payment' do
    post 'paid'    => 'payments#paid',    as: :payment_paid
    get 'success' => 'payments#success',  as: :payment_success
    get 'fail'    => 'payments#fail',     as: :payment_fail
  end
end
