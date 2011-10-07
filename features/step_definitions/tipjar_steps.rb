Given /^I request (.*) to play in (.*) for (\d+) dollars$/ do |band, place, money|
  visit new_request_path
  fill_in 'request_band_name', :with => band
  fill_in 'request_place', :with => place
  fill_in 'request_money', :with => money
  click_button 'Create Request' 
end
