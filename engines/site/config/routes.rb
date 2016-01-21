Site::Engine.routes.draw do
  root 'home#index'

  resources :properties, path: 'imoveis' do 
    get 'contact_new', to: 'properties#contact_new', as: 'contact_new'
    post 'contact_send', to: 'properties#contact_send', as: 'contact_send'
  end
end
