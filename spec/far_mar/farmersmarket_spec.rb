require "spec_helper"

describe FarMar::FarmersMarket do
  describe "find_by_attribute" do
    it "returns a Market instance by name" do
      expect(FarMar::Market.find_by_name("Preston")).to be_an_instance_of FarMar::Market
    end
    it "returns a Market instance by city" do
      expect(FarMar::Market.find_by_city("Silver").id).to eq 2
    end
    it "returns a Product instance by name" do
      expect(FarMar::Product.find_by_name("Honey").id).to eq 28
    end
    it "returns a Vendor instance by id" do
      expect(FarMar::Vendor.find_by_id(13).id).to eq 13
    end
    it "returns nil when nothing is found" do
      expect(FarMar::Vendor.find_by_id(10000)).to be_nil
    end
    it "returns a Sale instance by purchase time" do
      expect(FarMar::Sale.find_by_purchase_time("2013-11-12 14:38:29 -0800").id).to eq 7
    end
    it "raises an error when attribute is not a valid method" do
      expect{ FarMar::Market.find_by_applesauce("Preston") }.to raise_error NoMethodError
    end
    it "raises an error maybe" do
      expect(FarMar::Market.find_by_purchase_time("2013-11-12 14:38:29 -0800")).to be_falsey
    end
  end
  describe "find_all_by_attribute" do
    it "returns an array" do
      expect(FarMar::Market.find_all_by_city("Silver")).to be_an Array
    end
    it "is a dynamic class method" do
      expect(FarMar::Market.find_all_by_name("Preston")[0]).to be_an_instance_of FarMar::Market
      expect(FarMar::Product.find_all_by_name("Honey").length).to eq 2
      expect(FarMar::Vendor.find_all_by_id(13)[0].id).to eq 13
      expect(FarMar::Vendor.find_all_by_id(10000)).to eq []
      expect(FarMar::Sale.find_all_by_purchase_time("2013-11-12 14:38:29 -0800").length).to eq 4
    end
  end
end
