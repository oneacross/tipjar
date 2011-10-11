require 'spec_helper'

describe OpenidsController do

  it "should get new" do
    get 'new'
    response.should be_success
  end

  it "should be able to access the new url" do
    new_openid_url.should == "http://test.host/openids/new"
  end

  it "should be able to access the complete url" do
    complete_openids_url.should == "http://test.host/openids/complete"
  end

  it "should be able to access the new path" do
    new_openid_path.should == "/openids/new"
  end

  it "should be able to access /openids" do
    openids_path.should == "/openids"
  end

  xit "can call complete" do
    subject.complete
  end

end
