Then /^"(.*?)" should receive a rejection email$/ do |email|
  open_email(email)
  current_email.subject.should == 'Your registration has been rejected'
end

Then /^"(.*?)" should receive an approval email$/ do |email|
  open_email(email)
  current_email.subject.should == 'Your account has been approved'
end

Then /^that email should contain "(.*?)"$/ do |text|
  current_email.has_content?(text).should be_true
end

Then /^that email should contain a link to sign in$/ do
  current_email.has_link?("Sign in now").should be_true
end
