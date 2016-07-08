Rails.application.routes.draw do
  resources :food_items
  root 'home#index'
  get 'contact_us' => 'home#contact_us'
  get 'menu' => 'home#menu'
  get 'search_food_item' => 'food_items#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
