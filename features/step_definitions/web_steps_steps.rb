Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

When /^I follow "(.*?)"$/ do |link|
  click_link(link)
end

When /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I select "(.*?)" from "(.*?)"$/ do |value, field|
  select(value, :from => field)
end

When /^I check "([^"]*)"$/ do |checkbox_label|
  check(checkbox_label)
end

When /^I press "(.*?)"$/ do |button_name|
  click_button(button_name)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "(.*?)"$/ do |text|
  page.should_not have_content(text)
end
