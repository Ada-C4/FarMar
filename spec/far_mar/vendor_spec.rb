require "spec_helper"

describe FarMar do
  describe FarMar::Vendor do
    describe "initialize" do
      it "creates an instance of a Vendor" do
        expect(FarMar::Vendor.new).to be_an_instance_of FarMar::Vendor
      end
    end
  end
end
