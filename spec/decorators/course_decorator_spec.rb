require 'spec_helper'

describe CourseDecorator do
  let(:address) { Fabricate(:course_address) }
  let(:course) { Fabricate(:course, course_address: address) }
  subject{ CourseDecorator.new(course) }

  its(:audience) { should == "stranded islanders, shipwrecked persons" }
  its(:phone) { should == '678-867-5309' }
  its(:formatted_start_date) { should == (Date.today + 2.days).strftime("%b %e, %Y") }
  its(:formatted_end_date) { should == (Date.today + 1.week).strftime("%b %e, %Y") }
  its(:formatted_address) { should == "<dd>Catalina, California </dd>" }

  describe "#price" do

    it "returns dollar format when it starts with a digit" do
      course.price = "8.888"
      subject.price.should == "$8.89"
    end

    it "returns string format when it does not start with digit" do
      course.price = "For people: 9.00, rats: 8.00"
      subject.price.should == "For people: 9.00, rats: 8.00"
    end

  end
end
