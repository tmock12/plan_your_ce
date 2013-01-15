require 'spec_helper'

describe Course do

  describe "validations" do
    subject { Course.new }
    it { should have(1).errors_on(:phone) }
    it { should have(1).errors_on(:title) }
    it { should have(1).errors_on(:description) }
    it { should have(1).errors_on(:audience) }
    it { should have(1).errors_on(:credits) }
    it { should have(1).errors_on(:email) }
  end

  describe 'phone number format' do
    subject { Fabricate(:course, phone: phone) }

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
