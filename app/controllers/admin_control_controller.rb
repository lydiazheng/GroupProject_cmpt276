class AdminControlController < ApplicationController

  http_basic_authenticate_with :name => ENV["CP_USER"], :password => ENV["CP_PASSWORD"]
  def index
    @user = User.all
  end

  def new
  end

  def create
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Delete successfully!"
    redirect_to admin_control
  end
end
