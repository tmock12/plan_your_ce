require "spec_helper"

describe ProviderMailer do
    let(:provider) { Fabricate(:provider) }
    subject { mail }

  describe '#account_rejection' do
    let(:mail) { ProviderMailer.account_rejection(provider) }

    its(:to) { should == [provider.email] }
    its(:subject) { should == 'Your registration has been rejected' }
    its(:from) { should == ["hello@plan_your_ce.com"] }
  end

  describe '#account_activated' do
    let(:mail) { ProviderMailer.account_activated(provider) }

    its(:to) { should == [provider.email] }
    its(:subject) { should == 'Your account has been approved' }
    its(:from) { should == ["hello@plan_your_ce.com"] }
  end
end
