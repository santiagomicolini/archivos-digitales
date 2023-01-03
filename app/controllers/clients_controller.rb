class ClientsController < ApplicationController
  before_action :set_client, only: [:show]
  before_action :set_documents, only: [:show]

  def index
    @clients = Client.all
  end

  def show
    @documents = Document.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save!
      redirect_to @clients_path
    else
      render :new
    end
  end

  private

  def set_documents
    @documents = Document.find(params[:id])
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :cuit, :domicilio)
  end
end
