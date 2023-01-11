class ClientsController < ApplicationController
  before_action :set_client, only: [:show]
  before_action :set_documents, only: [:show]

  def index
    @clients = Client.all
  end

  def show
    if params[:query]
      @documents = Document.search_by_name_and_agency(params[:query]).where(client: @client)
    else
      @documents = Document.all
    end

    if params[:document].present?
      @documents = @documents.where((document_id params[:document]))
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save!
      redirect_to clients_path
    else
      render :new
    end
  end

  private

  def set_documents
    @documents = Document.where(client: @client)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :cuit, :domicilio)
  end
end
