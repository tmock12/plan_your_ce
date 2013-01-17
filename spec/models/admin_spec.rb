require 'spec_helper'

describe Admin do

  describe "relations" do
    before { Fabricate(:admin) }

    it "destroy's its user upon deletion" do
      expect{
        Admin.destroy_all
      }.to change{User.count}.by(-1)
    end
  end

end
