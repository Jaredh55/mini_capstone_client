Rails.application.routes.draw do
  namespace :client do
    get '/animals' => 'products#action'
  end
end
