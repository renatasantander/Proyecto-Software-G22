Rails.application.routes.draw do
  get 'carritos/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Rutas Usuarios
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  
  devise_scope :user do
    get "/users/sessions", to: "users/sessions#index"
    get "/users/edit/:id", to: "users/sessions#edit", as: "edit_user"
  end
  
  root to: "inicio#index"
  
  # Rutas Productos
  resources :productos do 
    resources :reviews
    resources :reservas, only: [:new, :create, :edit, :update]
    resources :carritos, only: [:update]
  end

  #Rutas de reservas y reviews asociadas a un usuario
  resources :users do
    resources :reservas, only: [:index, :show, :destroy]
    resources :carritos, only: [:index]
  end
  
  resources :chats do
    resources :mensajes
  end

  # get "carritos", to: "carritos#show"
  post "carritos/agregar"
  get "carritos/:id", to: "carritos#reservar", as: "reservar_carrito"
  patch "carritos/remove/:id", to: "carritos#remove", as: "remove_carrito"

end
