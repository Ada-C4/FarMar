require "spec_helper"
describe FarMar do
  describe FarMar::Vendor do

    before :each do
      vendor_info = ["1","Feil-Farrell","8","1"]
      @vendor = FarMar::Vendor.new(vendor_info)
    end

    describe "#initialize" do
      it "creates a new instance of the Vendor class" do
        expect(@vendor).to be_an_instance_of(FarMar::Vendor)
      end
      it "retrieves the vendor ID from the vendor info array" do
        expect(@vendor.id).to eq(1)
      end
    end

    describe ".all" do
      before :each do
        @vendors = CSV.read("./support/vendors.csv")
      end
      it "returns an array" do
        expect(FarMar::Vendor.all).to be_an(Array)
      end
      it "returns an array with all the vendors" do
        expect(FarMar::Vendor.all.length).to eq(@vendors.size)
      end
      it "contains instances of the Vendor class" do
        vendor_total = FarMar::Vendor.all.length
        expect(FarMar::Vendor.all[0]).to be_an_instance_of(FarMar::Vendor)
        expect(FarMar::Vendor.all[vendor_total - 1]).to be_an_instance_of(FarMar::Vendor)
        expect(FarMar::Vendor.all[vendor_total]).to be nil
      end
    end

    describe ".find(id)" do
      before :each do
        @id = rand(1..2690)
      end
      it "returns an instance of Vendor" do
        expect(FarMar::Vendor.find(@id)).to be_an_instance_of(FarMar::Vendor)
      end
      it "returns the Vendor with the matching id" do
        expect(FarMar::Vendor.find(@id).id).to eq(@id)
      end
    end

    describe "#market" do
      it "returns an instance of the Market class" do
        expect(@vendor.market).to be_an_instance_of(FarMar::Market)
      end
      it "returns the Market with the matching id" do
        expect(@vendor.market_id).to eq(@vendor.market.id)
      end
    end

    describe "#products" do
      it "returns a collection" do
        expect(@vendor.products).to be_an(Array)
      end
      it "returns instances of Products" do
        expect(@vendor.products[0]).to be_an_instance_of(FarMar::Product) if @vendor.products.length > 0
      end
    end

    describe "#sales" do
      it "returns a collection" do
        expect(@vendor.sales).to be_an(Array)
      end
      it "returns instances of Sales" do
        expect(@vendor.sales[0]).to be_an_instance_of(FarMar::Sale) if @vendor.sales.length > 0
      end
    end

    describe "#revenue" do
      it "returns a sum in cents" do
        expect(@vendor.revenue).to be_a(Fixnum)
      end
      it "returns the sum of sales" do
        expect(@vendor.revenue).to eq(38259)
      end
    end

    describe ".by_market(market_id)" do
      before :each do
        @market_id = rand(1..500)
      end
      it "returns a collection" do
        expect(FarMar::Vendor.by_market(@market_id)).to be_an(Array)
      end
      it "returns instances of Vendors" do
        expect(FarMar::Vendor.by_market(@market_id)[0]).to be_an_instance_of(FarMar::Vendor) if FarMar::Vendor.by_market(@market_id).length > 0
      end
    end
  end
end
