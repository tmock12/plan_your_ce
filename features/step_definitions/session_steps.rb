Given /^I am signed in as an activated provider$/ do
  @provider ||= Fabricate(:provider)
  @provider.activate!
  visit sign_in_path
  fill_in 'Email', with: @provider.email
  fill_in 'Password', with: 'shipwrecked'
  click_button 'Sign in'
end

Given /^I am signed in as an admin$/ do
  @admin ||= Fabricate(:admin)
  visit sign_in_path
  fill_in 'Email', with: @admin.email
  fill_in 'Password', with: 'shipwrecked'
  click_button 'Sign in'
end

Then /^I should be signed out$/ do
  current_path.should == root_path
  page.should_not have_content "Sign out"
  page.should have_content "Sign in"
end
