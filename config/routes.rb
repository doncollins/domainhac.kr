Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/api/domains', to: 'domains#index'
  get '/api/tlds', to: 'tlds#index'
end
