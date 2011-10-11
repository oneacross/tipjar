Given /^I request (.*) to play in (.*) for (\d+) bucks$/ do |band, place, money|
  User.create!(:identity_url => "abcd", :firstname => "Matt")
  visit '/users/1'
  fill_in 'request_band_name', :with => band
  fill_in 'request_place', :with => place
  fill_in 'request_money', :with => money
  click_button 'Make Request' 
end

Given /^I login with Google's OpenID url$/ do
  visit new_openid_path
  fill_in 'openid_url', :with => 'https://www.google.com/accounts/o8/id'
  click_button 'Login' 
end

Given /^I enter my credentials$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I should see my name$/ do
    pending # express the regexp above with the code you wish you had
end
