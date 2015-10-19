require "./spec/spec_helper.rb"

describe FarMar::Vendors do
  describe "initialize"
    vendors = Vendors.new
    it "creates a new instace of the vendors class" do
      expect(vendors).to be_an_instance_of Vendors
    end
end
