require "spec_helper"

describe FarMar::Sale do
  before :each do
    sale_hash = {
      id: 1,
      amount: 9290,
      purchase_time: "2013-11-07 04:34:56 -0800",
      vendor_id: 1,
      product_id: 1
    }

    @sale = FarMar::Sale.new(sale_hash)
  end

  describe "self.new" do
    it "creates a new instance of Sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end

    it "has an id property that is equal to what it is passed in" do
      expect(@sale.id).to eq 1
    end

    it "knows bout its associated data file" do
      expect(@sale.sales_csv).to eq ("./support/sales.csv")
    end
  end

    describe "self.all" do
      all_sales = FarMar::Sale.all
      it "returns an array" do
        expect(all_sales.class).to eq Array
        #test that it is an array
        expect(all_sales[0]).to be_an_instance_of FarMar::Sale
        expect(all_sales[-1]).to be_an_instance_of FarMar::Sale
        sales_csv= CSV.read("./support/sales.csv")
        expect(all_sales.length).to eq (sales_csv.length)
         #all markets length to equal csv.length
      end
    end

  #returns the instance of Market with matching the input # ID
    describe "self.find(id)" do
      it "returns an instance of FarMar::Sale with its passed in id" do
      expect(FarMar::Sale.find(1)).to be_an_instance_of FarMar::Sale
      expect(FarMar::Sale.find(1).amount).to eq 9290
      end
    end
  end
