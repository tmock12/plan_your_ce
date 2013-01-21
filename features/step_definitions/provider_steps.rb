Given /^that provider has been approved$/ do
  Provider.last.activate!
end

Given /^those providers have been approved$/ do
  Provider.all.each(&:activate!)
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

When /^that provider should be rejected$/ do
  Provider.last.rejected.should be_true
end

When /^I click on "(.*?)" for that provider$/ do |link|
  provider = Provider.last
  within(:css, "tr.provider") do
    click_link(link)
  end
end

