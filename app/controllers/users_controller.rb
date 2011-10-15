class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @request = Request.new
  end

  def logout
    session.delete(:openid)
    redirect_to root_url
  end

end
