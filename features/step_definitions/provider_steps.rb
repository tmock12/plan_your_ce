Given /^that provider has been approved$/ do
  Provider.last.activate!
end

Given /^I have a course$/ do
  Fabricate(:course, provider: @provider)
end
