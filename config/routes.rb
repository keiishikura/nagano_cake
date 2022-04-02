Rails.application.routes.draw do
    
  namespace :admin do
    resources :genres,only:[:index, :create, :edit, :update]
    resources :items,only:[:new, :create, :index, :show, :edit, :update]
    resources :customers,only:[:index, :show, :edit, :update]
  end
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :public do
    root to:"homes#top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
