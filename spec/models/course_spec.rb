require 'spec_helper'

describe Course do

  describe "validations" do
    subject { Course.new(start_date: Date.today, end_date: Date.yesterday) }
    it { should have(1).errors_on(:phone) }
    it { should have(1).errors_on(:title) }
    it { should have(1).errors_on(:description) }
    it { should have(1).errors_on(:audience) }
    it { should have(1).errors_on(:credits) }
    it { should have(1).errors_on(:email) }

    it "must have a start date before end date" do
      subject.should have(1).errors_on(:start_date)
    end
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

  describe "dependencies" do
    let(:provider) { Fabricate(:provider) }
    before { Fabricate(:course, provider: provider) }

    it "requires a provider" do
      expect {
        Provider.destroy_all
      }.to change{Course.count}.by(-1)
    end
  end

  describe "#active" do
    let!(:course2) { Fabricate(:course, end_date: (Date.today + 1.day)) }
    let!(:course1) { Fabricate(:course, end_date: Date.today) }

    it "returns active courses sorted by end date" do
      active_courses = Course.active
      active_courses.first.should == course1
      active_courses.last.should == course2
    end
  end
end
