class Client::ProductsController < ApplicationController
  def index
    client_params = {
                      search: params[:search],
                      sort_by: params[:sort_by],
                      sort_order: params[:sort_order]
                      }
    response = Unirest.get("http://localhost:3000/api/animals", parameters: client_params) #get does not send body params, using body params as syntax, gets sent as string query params
    @animals = response.body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                        name: params[:name],
                        price: params[:price],
                        description: params[:description],
                        supplier_id: params[:supplier_id]

                      }
    response = Unirest.post(
                            "http://localhost:3000/api/animals", parameters: client_params
                            )
    # render 'create.html.erb'
    flash[:success] = "Successfully created product"
    product = response.body
    redirect_to "/client/animals/#{product["id"]}"

  end

  def show
    animal_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/animals/#{animal_id}")
    @animal = response.body #hash
    render 'show.html.erb'
  end

  def edit
    @animal_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/animals/#{@animal_id}")
    @animal = response.body
    render 'edit.html.erb'
  end

    def update
        client_params = {
                          name: params[:name],
                          price: params[:price],
                          description: params[:description],
                          supplier_id: params[:supplier_id]

                      }
     response = Unirest.patch(
                             "http://localhost:3000/api/animals/#{ params[:id] }",
                             parameters: client_params
                            )
        # render 'update.html.erb'
      flash[:success] = "Successfully updated product"
      product = response.body
      redirect_to "/client/animals/#{product["id"]}"
  end

    def destroy
    animal_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/animals/#{ animal_id }")
    # render 'destroy.html.erb'
    flash[:success] = "Successfully deleted product"
    redirect_to "/client/animals"
  end
end
