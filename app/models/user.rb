class User < ActiveRecord::Base
  has_many :requests

  def self.is_logged_in?
    @is_logged_in
  end

  def self.logged_in
    @is_logged_in = true
  end

  def self.logged_out
    @is_logged_in = false
  end
end
