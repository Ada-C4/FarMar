require "spec_helper"

describe FarMar::FarmersMarket do
  describe "find_by_attribute" do
    it "is a dynamic class method" do
      expect(FarMar::Market.find_by_name("Preston")).to be_an_instance_of FarMar::Market
      expect(FarMar::Market.find_by_city("Silver").id).to eq 2
      expect(FarMar::Product.find_by_name("Honey").id).to eq 28
      expect(FarMar::Vendor.find_by_id(13).id).to eq 13
      expect(FarMar::Vendor.find_by_id(10000)).to be_nil
    end
  end
end
