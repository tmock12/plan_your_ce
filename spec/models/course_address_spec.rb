require 'spec_helper'

describe CourseAddress do

  describe "validations" do
    subject { CourseAddress.new }
    it { should have(1).errors_on(:city) }
    it { should have(1).errors_on(:state) }
  end

  describe "depencies" do
    let(:course) { Fabricate(:course) }
    before { Fabricate(:course_address, course: course) }

    it "requires a course" do
      CourseAddress.count.should == 1
      Course.destroy_all
      CourseAddress.count.should == 0
    end
  end

end
