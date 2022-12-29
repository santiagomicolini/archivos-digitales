class ClientsController < ApplicationController
  def index

  end
  def show

  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save!
      redirect_to @client, notice: "El documento se cargó correctamente"
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :cuit, :domicilio)
  end
end
