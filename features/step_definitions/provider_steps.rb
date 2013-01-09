Given /^that provider has been approved$/ do
  Provider.last.activate!
end
