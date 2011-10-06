Given /^I request (.*) to play in (.*) for (\d+) dollars$/ do |band, place, money|
    Request.create(:band_name => band, :place => place, :money => money)
end
