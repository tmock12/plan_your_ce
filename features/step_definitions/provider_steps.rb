Given /^that provider has been approved$/ do
  Provider.last.activate!
end

Given /^I have a course$/ do
  Fabricate(:course, provider: @provider)
end

Then /^I should see the providers:$/ do |attribute|
  within(:css, 'table') do
    attribute.rows.each do |cell|
      page.should have_content(@provider[cell.first])
    end
  end
end
