class DocumentsController < ApplicationController
  def new
    @cliuent = Client.find(params[:client_id])
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save!
      redirect_to @document, notice: "El documento se cargó correctamente"
    else
      render :new
    end
  end

  private

  def document_params
    params.require(:document).permit(:description, :agency, :tax_name, :date, :pdf_file)
  end
end
