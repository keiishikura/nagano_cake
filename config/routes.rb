Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
    post 'orders/confirm' => 'orders#confirm' , as: 'confirm'
    get 'orders/complete' => 'orders#complete', as: 'complete'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :customers,only:[:show, :edit, :update]
    resources :addresses,only:[:new, :create, :index, :edit, :update, :destroy]
    resources :items,only:[:index, :show]
    resources :cart_items,only:[:create, :index, :update, :destroy]
    resources :orders,only:[:new, :create, :index, :update, :show]
  end

  namespace :admin do
    # get '/top' => 'homes#top'
    root to:"homes#top"
  end

  namespace :admin do
    resources :genres,only:[:index, :create, :edit, :update]
    resources :items,only:[:new, :create, :index, :show, :edit, :update]
    resources :customers,only:[:index, :show, :edit, :update]
    resources :orders,only:[:show, :update, :index]
    resources :order_details,only:[:update]
  end

  scope module: :public do
    root to:"homes#top"
    get '/about' => 'homes#about',as:'about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
