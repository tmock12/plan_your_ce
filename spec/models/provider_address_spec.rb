require 'spec_helper'

describe ProviderAddress do

  describe "validations" do
    subject { ProviderAddress.new }
    it { should have(1).errors_on(:street_1) }
    it { should have(1).errors_on(:city) }
    it { should have(1).errors_on(:state) }
    it { should have(1).errors_on(:zip_code) }
  end

end
