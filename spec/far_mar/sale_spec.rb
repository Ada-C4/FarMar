require "spec_helper"

describe FarMar::Sale do
  before :each do
    row = [1, 100, "2015-10-19 06:22:33 -0800", 1, 1]
    @sale = FarMar::Sale.new(row[0], row[1], row[2], row[3], row[4])
  end
  describe ".new" do
    it "creates a new instance of Sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
  describe "#initialize" do
    it "creates instance variables" do
      expect(@sale.instance_variables.length).to eq 5
    end
    it "creates @id as an integer" do
      expect(@sale.id.class).to eq Fixnum
    end
    it "creates @purchase_date as a DateTime object" do
      expect(@sale.purchase_time).to be_an_instance_of DateTime
      expect(@sale.purchase_time.month).to eq 10
    end
  end
  describe "self.all" do
    it "returns an array of Sale instances" do
      expect(FarMar::Sale.all).to be_an Array
      expect(FarMar::Sale.all.length).to eq 12798
      expect(FarMar::Sale.all[0]).to be_an_instance_of FarMar::Sale
    end
  end
  describe "self.find(id)" do
    it "returns the name of the product sold" do
      @id = 11000
      @sale = FarMar::Sale.find(@id)
      expect(FarMar::Product.find(@sale.product_id).name). to eq "Fuzzy Burrito"
    end
  end
end
