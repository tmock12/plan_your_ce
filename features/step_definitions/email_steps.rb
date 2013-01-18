Then /^"(.*?)" should receive a rejection email$/ do |email|
  open_email(email)
  current_email.subject.should == 'Your registration has been rejected'
end

Then /^that email should contain "(.*?)"$/ do |text|
  current_email.has_content?(text).should be_true
end
