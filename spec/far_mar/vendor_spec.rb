require "spec_helper"
describe FarMar do
  describe FarMar::Vendor do

    before :each do
      @vendor = FarMar::Vendor.new
    end

    describe ".new" do
      it "creates a new instance of the Vendor class" do
        expect(@vendor).to be_an_instance_of(FarMar::Vendor)
      end
    end

  end
end
