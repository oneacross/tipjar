require 'openid'
require 'openid/store/filesystem'
require 'openid/extensions/ax'

class OpenidsController < ApplicationController
  def new
  end

  def create
    openid_url = params[:openid_url]
    check_id_req = openid_consumer.begin openid_url

    # TODO: detect invalid OpenID url

    # Get additional attributes from Google
    ax_req = OpenID::AX::FetchRequest.new
    ax_req.add(OpenID::AX::AttrInfo.new("http://axschema.org/namePerson/first", "firstname", true))
    check_id_req.add_extension(ax_req)

    redirect_url = check_id_req.redirect_url(root_url, complete_openids_url)
    puts "redirect_url: #{redirect_url}"
    redirect_to redirect_url
  end

  def complete

    # Get past the complete_id_res check
    params.delete('action')
    params.delete('controller')

    response = openid_consumer.complete(params, complete_openids_url)

    if response.status == OpenID::Consumer::SUCCESS
      identity_url = response.identity_url

      session[:openid] = identity_url

      qry = User.find_by_identity_url(identity_url)
      if qry.any?
        #  qry.first
      else
        # sign up the new user
        ax_rsp = OpenID::AX::FetchResponse.from_success_response(response, false)
        firstname = ax_rsp.get('http://axschema.org/namePerson/first')

        User.new(:identity_url => identity_url, :firstname => firstname)
      end

      # TODO: this is not an error
      flash[:error] = "Hello #{firstname}!!"

      redirect_to user_url
      return
    elsif response.status == OpenID::Consumer::SETUP_NEEDED
      flash[:error] = 'Could not log on with your OpenID: SETUP_NEEDED'
    elsif response.status == OpenID::Consumer::FAILURE
      flash[:error] = "Could not log on with your OpenID: FAILURE, message: #{response.message}"
    elsif response.status == OpenID::Consumer::CANCEL
      flash[:error] = 'Could not log on with your OpenID: CANCEL'
    else
      flash[:error] = 'Could not log on with your OpenID: other'
    end

    redirect_to root_url
  end

  protected

  def openid_consumer
    @openid_consumer ||= OpenID::Consumer.new(session,
      OpenID::Store::Filesystem.new("#{Rails.root}/tmp/openid"))
  end

end
