class AggregateRequest < ActiveRecord::Base

  def who
    if count == 1
      "#{count} person"
    else
      "#{count} people"
    end
  end

  def verb
    if count == 1
      "wants"
    else
      "want"
    end
  end
end
