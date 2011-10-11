class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @request = Request.new
  end

end
