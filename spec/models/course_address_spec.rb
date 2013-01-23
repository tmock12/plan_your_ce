require 'spec_helper'

describe CourseAddress do

  describe "validations" do
    subject { CourseAddress.new }
    it { should have(1).errors_on(:city) }
    it { should have(1).errors_on(:state) }
  end

  describe "depencies" do
    before do
      course = Fabricate(:course)
      Fabricate(:course_address, course: course)
    end

    it "requires a course" do
      expect{
        Course.destroy_all
      }.to change{CourseAddress.count}.by(-1)
    end
  end

end
