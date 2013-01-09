require 'spec_helper'

describe Provider do

  describe "validations" do
    subject { Provider.new }
    it { should have(1).errors_on(:name) }
    it { should have(1).errors_on(:street_address_1) }
    it { should have(1).errors_on(:city) }
    it { should have(1).errors_on(:state) }
    it { should have(1).errors_on(:zip_code) }
    it { should have(1).errors_on(:phone) }
    it { should have(2).errors_on(:email) }
    it { should have(1).errors_on(:cerp_number) }
  end

end
