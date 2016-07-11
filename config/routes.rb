Rails.application.routes.draw do
  get 'orders/new'

  get 'order/new'

  get 'order_detail/add_to_cart'

  resources :food_items
  resources :orders
  root 'home#index'
  get 'contact_us' => 'home#contact_us'
  get 'menu' => 'home#menu'
  get 'search_food_item' => 'food_items#search'
  post 'add_to_cart' => 'order_detail#add_to_cart'
  get 'shopping_cart' => 'orders#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
