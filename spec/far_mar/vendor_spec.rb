require "spec_helper"

describe FarMar do
  describe FarMar::Vendor do
    before :all do
      @vendor_hash = {
      :id => 1,
      :name => "vendor name",
      :num_employees => "number of employees",
      :market_id => 1
      }
      @vendor = FarMar::Vendor.new({
        :id => 1,
        :name => "vendor name",
        :num_employees => 8,
        :market_id => 1
        })
    end

    describe "initialize" do
      it "creates an instance of a Vendor" do
        expect(FarMar::Vendor.new(@vendor_hash)).to be_an_instance_of FarMar::Vendor
      end
    end

    describe "self.all" do
      it "returns an array" do
        expect(FarMar::Vendor.all).to be_an Array
      end
      it "has Vendor instances in the array" do
        expect(FarMar::Vendor.all[0]).to be_an_instance_of FarMar::Vendor
      end
      it "has the correct number of Vendor instances in the array" do
        expect(FarMar::Vendor.all.length).to eq 2690
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
      it "returns nil if the argument is not a Fixnum" do
        expect(FarMar::Vendor.find("abc")).to be_nil
        expect(FarMar::Vendor.find(1.24)).to be_nil
        expect(FarMar::Vendor.find(:id)).to be_nil
      end
      it "returns nil if passed a Fixnum that isn't a valid ID" do
        expect(FarMar::Vendor.find(-1)).to be_nil
      end
    end

    describe "find_market" do
      it "returns an instance of Market" do
        expect(@vendor.find_market(1)).to be_an_instance_of FarMar::Market
      end
      it "returns a Market object which has a market id that matches the vendor's market id" do
        num = 1
        market = @vendor.find_market(num)
        expect(market.id).to eq num
      end
      it "returns nil if the argument is not a Fixnum" do
        expect(@vendor.find_market("abc")).to be_nil
        expect(@vendor.find_market(1.24)).to be_nil
        expect(@vendor.find_market(:id)).to be_nil
      end
      it "returns nil if passed a Fixnum that isn't a valid ID" do
        expect(@vendor.find_market(-1)).to be_nil
      end
    end

    describe "find_products" do
      it "returns an array" do
        expect(@vendor.find_products(@vendor.id)).to be_an Array
      end
      it "has Product items in the array" do
        expect(@vendor.find_products(@vendor.id)[0]).to be_an_instance_of FarMar::Product
      end
      it "has Product items that contain the correct vendor_id" do
        expect(@vendor.find_products(@vendor.id)[0].name).to eq "Dry Beets"
      end
      it "returns empty Array if the argument is not a Fixnum" do
        expect(@vendor.find_products("abc")).to eq []
        expect(@vendor.find_products(1.24)).to eq []
        expect(@vendor.find_products(:id)).to eq []
      end
      it "returns empty Array if passed a Fixnum that isn't a valid ID" do
        expect(@vendor.find_products(-1)).to eq []
      end
    end

    describe "find_sales" do
      it "returns an array" do
        expect(@vendor.find_sales(@vendor.id)).to be_an Array
      end
      it "has Sale items in the array" do
        expect(@vendor.find_sales(@vendor.id)[0]).to be_an_instance_of FarMar::Sale
      end
      it "had Sale items that contain the correct vendor_id" do
        expect(@vendor.find_sales(@vendor.id)[0].purchase_time).to eq DateTime.parse("2013-11-07 04:34:56 -0800")
      end
      it "returns empty Array if the argument is not a Fixnum" do
        expect(@vendor.find_sales("abc")).to eq []
        expect(@vendor.find_sales(1.24)).to eq []
        expect(@vendor.find_sales(:id)).to eq []
      end
      it "returns empty Array if passed a Fixnum that isn't a valid ID" do
        expect(@vendor.find_sales(-1)).to eq []
      end
    end

    describe "revenue" do
      it "returns an integer" do
        expect(@vendor.revenue(@vendor.id)).to be_a Fixnum
      end
      it "returns the correct sum of the Sale amounts" do
        expect(@vendor.revenue(1)).to eq 38259
      end
      it "returns 0 if the argument is not a Fixnum" do
        expect(@vendor.revenue("abc")).to eq 0
        expect(@vendor.revenue(1.24)).to eq 0
        expect(@vendor.revenue(:id)).to eq 0
      end
      it "returns 0 if passed a Fixnum that isn't a valid ID" do
        expect(@vendor.revenue(-1)).to eq 0
      end
    end

    describe "self.by_market" do
      it "returns an array" do
        expect(FarMar::Vendor.by_market(1)).to be_an Array
      end
      it "has Vendor instances in the array" do
        expect(FarMar::Vendor.by_market(1)[0]).to be_an_instance_of FarMar::Vendor
      end
      it "returns an empty Array if the argument is not a Fixnum" do
        expect(FarMar::Vendor.by_market("abc")).to eq []
        expect(FarMar::Vendor.by_market(1.24)).to eq []
        expect(FarMar::Vendor.by_market(:id)).to eq []
      end
      it "returns an empty Array if passed a Fixnum that isn't a valid ID" do
        expect(FarMar::Vendor.by_market(-1)).to eq []
      end
    end

  end
end
