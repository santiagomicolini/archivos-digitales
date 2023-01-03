class DocumentsController < ApplicationController
  before_action :set_client, only: [:new]
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save!
      redirect_to clients_path
    else
      render :new
    end
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def document_params
    params.require(:document).permit(:client_id, :description, :agency, :tax_name, :date, :file)
  end
end
