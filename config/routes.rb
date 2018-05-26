Rails.application.routes.draw do
  get '/' => 'client/products#index'

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"


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
