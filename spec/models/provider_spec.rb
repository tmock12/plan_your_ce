require 'spec_helper'

describe Provider do

  describe "validations" do
    subject { Provider.new }
    it { should have(1).errors_on(:name) }
    it { should have(1).errors_on(:street_address_1) }
    it { should have(1).errors_on(:city) }
    it { should have(1).errors_on(:state) }
    it { should have(1).errors_on(:zip_code) }
    it { should have(1).errors_on(:phone) }
    it { should have(2).errors_on(:email) }
    it { should have(1).errors_on(:cerp_number) }
  end

  describe 'activation fields' do
    let(:provider) { Fabricate(:provider) }
    subject { provider }

    context 'non-activated provider' do
      its(:activated?) { should be_false }
      its(:activation_token) { should_not be_nil }
    end

    context 'activated provider' do
      before { provider.activate! }
      its(:activated?) { should be_true }
    end
  end

end
