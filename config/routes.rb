Rails.application.routes.draw do
  get 'welcome/index'

  root "welcome#index" #tutaj zmieniamy stronę główną

  resources :articles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
