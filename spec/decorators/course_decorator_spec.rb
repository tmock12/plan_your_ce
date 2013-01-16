require 'spec_helper'

describe CourseDecorator do
  let(:address) { Fabricate(:course_address) }
  let(:course) { Fabricate(:course, course_address: address) }
  subject{ CourseDecorator.new(course) }

  its(:audience) { should == "stranded islanders, shipwrecked persons" }
  its(:phone) { should == '678-867-5309' }
  its(:start_date) { should == Date.today.strftime("%b %e, %Y") }
  its(:end_date) { should == Date.tomorrow.strftime("%b %e, %Y") }
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
