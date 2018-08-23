Rails.application.routes.draw do
  resources :firms, only: [:new, :edit, :udate, :create, :show, :index]
  get 'landing/index'
  get 'quotations/index'
  get 'quotations/new'
  get 'quotations/create'
  get 'quotations/show'
  get 'product_associates/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/products', to: 'products#index'
  #get 'products/:id', to: 'products#show'
  resources :products
  resources :email_messages#, only: [:new, :create, :show, :index]
  resources :message_answers
  resources :quotations

  #get '/product_associates', to: 'product_associates#index'

  resources :chat_rooms, only: [:new, :create, :show, :index]
  #root 'chat_rooms#index'  

  resources :messages

  mount ActionCable.server => '/cable'

  get '/users',   to: 'users#index'

  devise_for :users

  authenticated do
    root :to => 'products#index', as: :authenticated_root
  end

  root  to: 'landing#index'  
#  !authenticated do
#    root  to: 'landing#index'  
#  end


  #get '/landing', to: "landing#index"


  resources :product_associates, only: [:new, :create, :index]

  resources :categories, only:[:new,:create]
  resources :assetclasses, only:[:new,:create]  
end
