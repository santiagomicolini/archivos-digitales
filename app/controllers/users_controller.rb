class UsersController < ApplicationController
  def show
    @users = User.find(params[:id])
    @clients = Client.all
  end

end
