require 'spec_helper'

describe CourseAddress do

  describe "validations" do
    subject { CourseAddress.new }
    it { should have(1).errors_on(:city) }
    it { should have(1).errors_on(:state) }
  end

end
