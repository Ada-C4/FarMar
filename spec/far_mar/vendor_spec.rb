require "spec_helper"

describe FarMar do
  describe FarMar::Vendor do
    before :each do
    #  @vendor = FarMar::Vendor.new
    end

    describe "#initialize" do
      it "creates a new instance of Vendor" do
        fake_hash = {:id => 666, :name => "Boo Boo", :team_size => 12, :market_id => 555}
        test = FarMar::Vendor.new(fake_hash)
        expect(test).to be_an_instance_of FarMar::Vendor
      end
    end

    describe '#self.all' do
      it "returns a collection of Vendor instances" do
        expect(FarMar::Vendor.all.length).to eq CSV.read("support/vendors.csv").length
      end
    end

    describe "self.find(id)" do
      it "returns specific instance of vendor" do
        find_test = FarMar::Vendor.find(15)
        expect(find_test.name).to eq "Hyatt-King"
      end
    end

    describe "list_markets" do
      it "returns specific market instance" do
        market_test = FarMar::Vendor.find(20)
        expect(market_test.list_markets.name).to eq "Jefferson City Farmer's Market"

      end
    end

    describe "list_products" do
      it "returns array of product instances" do
        product_test = FarMar::Vendor.find(100)
        product_test.list_products.each do |product|
          expect(product.vendor_id).to eq 100
        end
      end
    end
  end
end
