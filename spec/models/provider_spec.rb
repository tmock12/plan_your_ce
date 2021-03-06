require 'spec_helper'

describe Provider do

  describe "validations" do
    subject { Provider.new }
    it { should have(1).errors_on(:name) }
    it { should have(1).errors_on(:phone) }
    it { should have(1).errors_on(:cerp_number) }
  end

  describe 'activation fields' do
    let(:provider) { Fabricate(:provider) }
    subject { provider }

    context 'non-activated provider' do
      its(:activated?) { should be_false }
    end

    context 'activated provider' do
      before { provider.activate! }
      its(:activated?) { should be_true }
    end
  end

  describe 'phone number format' do
    subject { Fabricate(:provider, phone: phone) }

    context 'US number with no country code' do
      let(:phone) { '7708675309' }
      its(:phone) { should == '17708675309' }
    end

    context 'US number with country code' do
      let(:phone) { '15551234567' }
      its(:phone) { should == '15551234567' }
    end

    context 'US number with dashes and spaces' do
      let(:phone) { '770 867-5309' }
      its(:phone) { should == '17708675309' }
    end
  end

end
