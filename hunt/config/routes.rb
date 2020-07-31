Rails.application.routes.draw do
  get 'animals/index'
  get 'animals/show'
  get 'animals/new'
  get 'animals/edit'

  resources :animals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'animals/index'

  root 'animals#index'
end
