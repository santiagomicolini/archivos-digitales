class ClientsController < ApplicationController
  before_action :set_client, only: [:show]
  before_action :set_documents, only: [:show]

  def index
    @clients = Client.all
  end

  def show
    if params[:search]
      @documents = Document.search_by_name_and_agency(params[:search]).where(client: @client)
    else
      @documents = Document.where(client: @client)
    end

    if params[:query]
      @documents = @documents.where(tax_name: params[:query]).where(client: @client)
    end

    # the agency: in line 22 is related with the column in the schema --> to see if agency is present in the params
    # So i want to show the documents where where params and agency(schema) are equals. !!??
    if params[:agency_filter]
      @documents = @documents.where(agency: params[:agency_filter]).where(client: @client)
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
