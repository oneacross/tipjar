require 'spec_helper'

describe OpenidController do

  it "should get new" do
    get 'new'
    response.should be_success
  end

  it "should be able to post to complete" do
    post 'complete'
    response.should be_success
  end

end
