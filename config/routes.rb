Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  namespace :public do
    get 'homes/top' => 'homes#top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
