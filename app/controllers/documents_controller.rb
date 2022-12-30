class DocumentsController < ApplicationController
  def new
    @client = Client.find(params[:client_id])
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save!
      redirect_to @document
    else
      render :new
    end
  end

  private

  def document_params
    params.require(:document).permit(:client_id, :description, :agency, :tax_name, :date, :file)
  end
end
