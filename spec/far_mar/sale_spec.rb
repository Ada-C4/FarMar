require "./spec/spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(1, 9290, "2013-11-07 04:34:56 -0800", 1, 1)
    @sale2 = FarMar::Sale.new(175, 5824, "2013-11-07 21:51:51 -0800", 34, 105)
  end

  describe "initialize" do
    it "creates an instance of Farmar::Sale class" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe "#self.all" do
    it "returns an Array" do
      expect(FarMar::Sale.all).to be_an_instance_of Array
    end
    it "returns all 12001 instances in csv file" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
    it "returns instances of FarMar::Sale" do
      expect(FarMar::Sale.all[0].id).to eq 1
      expect(FarMar::Sale.all[0].amount).to eq 9290
      expect(FarMar::Sale.all[0].vendor_id).to eq 1
    end
  end

  describe "#self.find" do
    it "returns the FarMar::Sale with the specified id" do
      expect(FarMar::Sale.find(2)).to be_an_instance_of FarMar::Sale
      expect(FarMar::Sale.find(2).amount).to eq 2262
    end
  end

  describe "vendor" do
    it "returns the FarMar::Vendor instance that is associated with this sale" do
      expect(@sale.vendor).to be_an_instance_of FarMar::Vendor
      expect(@sale.vendor.id).to eq 1
      expect(@sale2.vendor.id).to eq 34
    end
  end

  describe "product" do
    it "returns the FarMar::Product instance that is associated with this sale" do
      expect(@sale.product).to be_an_instance_of FarMar::Product
      expect(@sale.product.name).to eq "Dry Beets"
      expect(@sale2.product.name).to eq "Happy Mushrooms"
    end
  end


  describe "#self.between(beginning_time, end_time)" do
        before :each do
          @beginning_time = DateTime.strptime("2013-11-06 08:35:40 -0800", "%Y-%m-%d %H:%M:%S %z")
          @end_time = DateTime.strptime("2013-11-13 08:35:16 -0800", "%Y-%m-%d %H:%M:%S %z")
        end
        it "returns a collection" do
          expect(FarMar::Sale.between(@beginning_time, @end_time)).to be_an(Array)
        end
        it "returns Sale objects" do
          expect(FarMar::Sale.between(@beginning_time, @end_time)[0]).to be_an_instance_of FarMar::
        end
        it "returns FarMar::Sale objects that have a purchase_time between beginning_time and end_time" do
          expect(FarMar::Sale.between(@beginning_time, @end_time).length).to eq 12798
        end
      end
end
