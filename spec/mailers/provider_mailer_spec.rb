require "spec_helper"

describe ProviderMailer do
  describe '#account_rejection' do
    let(:provider) { Fabricate(:provider) }
    let(:mail) { ProviderMailer.account_rejection(provider) }
    subject { mail }

    its(:to) { should == [provider.email] }
    its(:subject) { should == 'Your registration has been rejected' }
    its(:from) { should == ["hello@plan_your_ce.com"] }
  end
end
