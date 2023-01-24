require 'open-uri'

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

  def download
    pdf = Prawn::Document.new
    pdf.text "hi"
    send_data(pdf.render, filename: "archivo", type: "application/pdf")
  end

  def preview
    @document = Document.find(params[:id])
    pdf = Prawn::Document.new

    params[:images][0..-2].each_with_index do |img, index|
      doc_image = URI.open(img)
      pdf.image doc_image, fit: [700, 700], position: :center, position: :center
      # pdf.start_new_page unless params[:images][index + 1].nil?
    end

    # pdf.image doc_image, fit: [800, 800], position: :center, position: :center
    send_data(pdf.render, filename: "#{@document.agency}_#{@document.tax_name}", type: "application/pdf", disposition: "inline")
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def document_params
    params.require(:document).permit(:client_id, :description, :agency, :tax_name, :date, :file)
  end
end
