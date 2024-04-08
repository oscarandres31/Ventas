Rails.application.routes.draw do
  resources :customers
  devise_for :users, path:"auth", path_names: { sing_in: "sessions", sing_out: "registrations" }
  resources :categories
  resources :products
  resources :dashboard
  resources :sales, except: [:show, :update]
  resources :sale_datail
  get 'buscador_producto/:termino', to: 'products#buscador'
  post 'add_item_venta', to: 'sales#add_item'

   root "dashboard#index"
end
