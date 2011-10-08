class RequestsController < ApplicationController
  def index
    @requests = Request.all
    @request = Request.new
  end

  def new
    @request = Request.new

    respond_to do |format|
      format.html
      format.json { render :json => @request }
    end
  end

  def create
    @request = Request.new(params[:request])
    if @request.save
      redirect_to requests_index_path
    else
      render :action => 'new'
    end
  end

end
