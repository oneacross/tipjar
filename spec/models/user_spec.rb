require 'spec_helper'

describe User do
  it "has an identity_url" do
    user = User.create!(:identity_url => "abcd")
    User.find_by_identity_url("abcd").should == user
  end

  it "does not match a different user" do
    user1 = User.create!(:identity_url => "abcd")
    user2 = User.create!(:identity_url => "wxyz")
    User.find_by_identity_url("abcd").should_not == user2
  end
end
