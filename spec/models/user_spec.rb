require 'spec_helper'

describe User do

  describe "validations" do
    subject { User.new }
    it { should have(2).errors_on(:email) }
    it { should have(1).errors_on(:password) }
  end

  describe "set_role!" do
    let(:user) { Fabricate(:user) }

    it "should set a users role" do
      user.set_role!("provider")
      user.role.should == "provider"
    end
  end

end
