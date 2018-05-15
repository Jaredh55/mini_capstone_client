Rails.application.routes.draw do
  get '/' => 'client/animals#action'
  namespace :client do
    get '/animals' => 'products#index'
    get '/animals/new' => 'products#new'
    post '/animals' => 'products#create'
    get '/animals/:id' => 'products#show'
    get '/animals/:id/edit' => 'products#edit'
    patch 'animals/:id' => 'products#update'
    delete '/animals/:id' => 'products#destroy'
  end
end
