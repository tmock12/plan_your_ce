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
