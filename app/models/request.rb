class Request < ActiveRecord::Base
  belongs_to :user

  def verb
    "would pay #{money} bucks"
  end
end
