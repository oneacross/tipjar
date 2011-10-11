require 'spec_helper'

describe User do
  before do
    @user = User.create!(:identity_url => "abcd")
  end

  it "has an identity_url" do
    User.find_by_identity_url("abcd").should == @user
  end

  it "does not match a different user" do
    user2 = User.create!(:identity_url => "wxyz")
    User.find_by_identity_url("abcd").should_not == user2
  end

  it "can detect when a user does not exist" do
    User.find_by_identity_url("lmno").should be_nil
  end

  it "can have many requests" do
    req1 = Request.create!(:band_name => "The X",
                           :place => "Owego, NY",
                           :money => 10)
    req2 = Request.create!(:band_name => "The Zed",
                           :place => "Owego, NY",
                           :money => 20)
    user = User.create!(:identity_url => "abcd",
                        :requests => [req1, req2])

    user.requests.should == [req1, req2]    
  end
end
