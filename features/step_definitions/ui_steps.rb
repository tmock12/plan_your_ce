When /^I select "(.*?)" as the "(.*?)"$/ do |date, field|
  month, day, year = date.split('/')
  select_field = field.downcase.parameterize('_')
  find(:css, %Q(select[id*="#{select_field}_1i"])).select(year)
  find(:css, %Q(select[id*="#{select_field}_2i"])).select(month)
  find(:css, %Q(select[id*="#{select_field}_3i"])).select(day.to_i.to_s)
end

Then /^I should see the following:$/ do |table|
  table.rows.each do |row|
    page.should have_content row.first
  end
end

Then /^I should see the following values:$/ do |table|
  table.rows.each do |field, value|
    page.find_field(field).value.should == value
  end
end

Then /^I should see (\d+) providers$/ do |provider_count|
  page.should have_selector('tr.provider', count: provider_count)
end

Then /^I should see the link "(.*?)"$/ do |link_name|
  page.has_link?(link_name).should be_true
end

Then /^I should not see the link "(.*?)"$/ do |link_name|
  page.has_link?(link_name).should be_false
end
