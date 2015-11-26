class ClientsController < ApplicationController
  
  before_filter :authenticate_user!

  load_and_authorize_resource
  # 7 actions
  # index - listing resources  Client.all
  # new - setuo object @client = client.new
  # create - @client.save
  # show - @client.name  lists each valu
  # edit - fetch resource to edit @client = Client.find(2)
  # update - @client.update_attributes
  # destroy - @client.destroy
  
  def index
    @clients = current_user.is_admin? ? Client.all : current_user.clients
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    if @client.save
      redirect_to clients_path
    else 
      render action: "new"
    end
  end
  
  def show
    begin
    @client = current_user.is_admin? ? Client.find(params[:id]) : current_user.clients.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "Record does not exist"
    end
  end
  
  def edit
    @client = (current_user.role? "super_admin") ? Client.find(params[:id]) : current_user.clients.find(params[:id])  
  end
  
  def update
    @client = current_user.clients.find(params[:id])
    if @client.update_attributes(client_params)
      redirect_to client_path(@client)
    else 
      render action: "edit"
    end
  end
  
  def destroy
    @client = current_user.clients.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end
  
  
  private
  
  def client_params
    params[:client].permit(:name, :company, :email, :website)
  end
  
  
end
