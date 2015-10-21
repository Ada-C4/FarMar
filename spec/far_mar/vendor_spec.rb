require "spec_helper"

describe FarMar do
  describe FarMar::Vendor do
    describe "initialize" do
      it "creates an instance of a Vendor" do
        @vendor_hash = {
        :id => 123,
        :name => "vendor name",
        :num_employees => "number of employees",
        :market_id => 456
        }
        expect(FarMar::Vendor.new(@vendor_hash)).to be_an_instance_of FarMar::Vendor
      end
    end

    describe "self.all" do
      it "returns an array" do
        expect(FarMar::Vendor.all).to be_an Array
      end
    end

    describe "self.find" do
      it "returns an instance of vendor" do
        num = rand(1..2690)
        expect(FarMar::Vendor.find(num)).to be_an_instance_of FarMar::Vendor
      end
      it "returns an instance of vendor with the correct ID" do
        num = 1
        vendor = FarMar::Vendor.find(num)
        expect(vendor.id).to eq 1
      end
    end

    describe "find_market" do
      before :each do
        @vendor = FarMar::Vendor.new({
          :id => 123,
          :name => "vendor name",
          :num_employees => 18,
          :market_id => 24
          })
      end
      it "returns a Market object" do
        expect(@vendor.find_market(1)).to be_an_instance_of FarMar::Market
      end
      it "returns a Market object which has a market id that matches the vendor's market id" do
        num = 1
        market = @vendor.find_market(num)
        expect(market.id).to eq num
      end
    end

    describe "find_products" do
      before :each do
        @vendor = FarMar::Vendor.new({
          :id => 1,
          :name => "vendor name",
          :num_employees => 18,
          :market_id => 1
          })
      end
      it "returns an array" do
        expect(@vendor.find_products(@vendor.id)).to be_an Array
      end
      it "has Product items in the array" do
        expect(@vendor.find_products(@vendor.id)[0]).to be_an_instance_of FarMar::Product
      end
    end

    describe "find_sales" do
      before :each do
        @vendor = FarMar::Vendor.new({
          :id => 1,
          :name => "vendor name",
          :num_employees => 18,
          :market_id => 1
          })
      end
      it "returns an array" do
        expect(@vendor.find_sales(@vendor.id)).to be_an Array
      end
      it "has Sale items in the array" do
        expect(@vendor.find_sales(@vendor.id)[0]).to be_an_instance_of FarMar::Sale
      end
    end
  end
end
