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
end
