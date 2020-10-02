class InventoriesController < ApplicationController

  # GET: /inventories
  get "/inventories" do
    #redirect if_logged_out
    @inv = current_user.inventories
    erb :"/inventories/index.html"
  end

  # GET: /inventories/new
  get "/inventories/new" do
    #redirect if_logged_out
    erb :"/inventories/new.html"
  end


  # POST: /inventories
  post "/inventories" do
     @inv = Inventory.new(year: params[:year], make: params[:make], model: params[:model], kind: params[:kind], user_id: current_user.id)
    if @inv.save 
      redirect "/inventories/#{@inv.id}"
    else
      erb :"inventories/new.html"
    end
    redirect "/inventories"
  end

  # GET: /inventories/5
  get "/inventories/:id" do
    #redirect if_logged_out
    @inv = Inventory.find(params[:id])
    erb :"/inventories/show.html"
    
  end

  # GET: /inventories/5/edit
  get "/inventories/:id/edit" do
    @inv = Inventory.find(params[:id])
    if authorized_user?(@inv)
      erb :"/inventories/edit.html"
    else
      redirect "/inventories"
    end
    
    erb :"/inventories/edit.html"
  end

  # PATCH: /inventories/5
  patch "/inventories/:id" do
    @inv = Inventory.find(params[:id])
    @inv.update(year: params[:year],
    make: params[:make],
    model: params[:model],
    kind: params[:kind])
    
  end

  # DELETE: /inventories/5/delete
  delete "/inventories/:id" do
    inv = Inventory.find(params[:id])
    inv.destroy
    redirect "/inventories"
  end
end
