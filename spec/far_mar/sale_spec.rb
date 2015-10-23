require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new
  end

    describe ".new" do
      it "creates a new instance of a sale" do
        expect(@sale).to be_an_instance_of FarMar::Sale
      end

      it "by default assigns empty strings to instance variables" do
        expect(@sale.id).to eq ""
        expect(@sale.vendor_id).to eq ""
      end

      it "accepts parameters passed in" do
        @sale2 = FarMar::Sale.new("1", "15", "", "", "10")
        expect(@sale2.amount).to eq "15"
        expect(@sale2.product_id).to eq "10"
      end
    end

    describe "self.all" do
      context "default csv is passed in" do
        it "creates an array of sale objects from default csv" do
          all = FarMar::Sale.all
          my_csv = CSV.read("./support/sales.csv")
          expect(all.length).to eq my_csv.length
          expect(all).to be_an_instance_of Array
          expect(all[0].class).to eq FarMar::Sale
          expect(all[16].amount).to eq "3442"
        end
      end

      context "non-default csv is passed in" do
        it "creates an array of sale objects from default csv" do
          all = FarMar::Sale.all("./support/sales2.csv")
          my_csv = CSV.read("./support/sales2.csv")
          expect(all.length).to eq my_csv.length
          expect(all).to be_an_instance_of Array
          expect(all[0].class).to eq FarMar::Sale
          expect(all[4].purchase_time).to eq "2013-11-10 05:20:05 -0800"
          expect(all[5].vendor_id).to eq "1"
        end
      end
    end

    describe "self.find" do
    context "default csv is passed in" do
      it "returns an instance of a sale matching the passed id" do
        id17 = FarMar::Sale.find(17)
        id33 = FarMar::Sale.find(33)
        expect(id17.vendor_id).to eq "4"
        expect(id33.class).to eq FarMar::Sale
        expect(id33.vendor_id).to eq "7"
      end
    end

    context "non-default csv is passed in" do
      it "returns an instance of a sale matching the passed id" do
        id9 = FarMar::Sale.find(9, "./support/sales2.csv")
        expect(id9.vendor_id).to eq "4"
        expect(id9.amount).to eq "9100"
        expect(id9.class).to eq FarMar::Sale
      end
    end
  end

  describe "self.between" do
    it "returns an Array of FarMar::Sale objects where the purchase time is between the two times given as arguments" do
      beginning_time1 = "2013-11-07 04:30:56 -0800"
      end_time1 = "2013-11-11 11:31:52 -0800"
      beginning_time2 = "2013-11-07 04:30:56 -0800"
      end_time2 = "2013-11-07 04:30:56 -0800"
      sold_in_range =  FarMar::Sale.between(beginning_time1, end_time1, "./support/sales2.csv")
      expect(sold_in_range.length).to eq 5
      sold_in_range2 = FarMar::Sale.between(beginning_time2, end_time2, "./support/sales2.csv")
      expect(sold_in_range2.length).to eq 0
    end
  end

  describe "#vendor" do
    it "returns the vendor instance associated with the given sale" do
      @sale3 = FarMar::Sale.new("4", "", "9", "7", "")
      vendor_match = @sale3.vendor("./support/vendors2.csv")
      expect(vendor_match).to be_an_instance_of FarMar::Vendor
      expect(vendor_match.id).to eq "7"
      expect(vendor_match.name).to eq "Bechtelar Inc"
    end
  end

  describe "#product" do
    it "returns the product instance associated with the given sale" do
      @sale2 = FarMar::Sale.new("4", "", "9", "7", "2")
      product_match = @sale2.product("./support/products2.csv")
      expect(product_match).to be_an_instance_of FarMar::Product
      expect(product_match.id).to eq "2"
      expect(product_match.name).to eq "Fierce Greens"
    end
  end

end
