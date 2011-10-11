require 'spec_helper'

describe UsersController do

  it "can access user_url" do
    users_path.should == '/users'
  end

end
