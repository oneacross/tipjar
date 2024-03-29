class RequestsController < ApplicationController
  def index
    requests = Request.all
    @request = Request.new
    @aggregate_requests = AggregateRequest.all

    if session[:openid]
      logged_in = true
      user_id = session[:user_id]
    else
      logged_in = false
      user_id = nil
    end
    render 'index', :locals => {:logged_in => logged_in,
                                :user_id => user_id}
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
    @request.user = User.find_by_identity_url(session[:openid])
    user_id = session[:user_id]

    # Detect if there is an existing aggregate
    # request for this band and place
    rel = AggregateRequest.where(
      :band_name => @request.band_name,
      :place => @request.place
    )
    if rel.any?
      agg_req = rel.first
      agg_req.count += 1
      agg_req.money += @request.money
      agg_req.save!
    else
      AggregateRequest.new(
        :band_name => @request.band_name,
        :place => @request.place,
        :count => 1,
        :money => @request.money
      ).save!
    end

    if @request.save
      redirect_to user_url(user_id)
    else
      render :action => 'new'
    end
  end

end
