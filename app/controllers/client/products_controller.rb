class Client::ProductsController < ApplicationController
  def action
    response = Unirest.get("http://localhost:3000/api/animals")
    @animals = response.body
    render 'index.html.erb'
  end
end
