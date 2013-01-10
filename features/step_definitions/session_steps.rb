Given /^I am signed in$/ do
  @provider ||= Fabricate(:provider)
  @provider.activate!
  visit sign_in_path
  fill_in 'Email', with: @provider.email
  fill_in 'Password', with: 'shipwrecked'
  click_button 'Sign in'
end
