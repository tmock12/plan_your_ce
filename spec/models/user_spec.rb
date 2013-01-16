require 'spec_helper'

describe User do

  describe "validations" do
    subject { User.new }
    it { should have(2).errors_on(:email) }
    it { should have(1).errors_on(:password) }
  end

end
