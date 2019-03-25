Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'films#index'

  get "/detalle", to: "films#show", as: "film"

  get "/personaje", to: "films#personaje", as: "personaje"

end
