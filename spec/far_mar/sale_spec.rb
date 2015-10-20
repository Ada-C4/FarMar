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
    it "creates a new instance of Sale with 5 instance variables" do
      expect(@sale.instance_variables.length).to eq 5
    end
    it "creates a new instance of Sale with @id as an integer" do
      expect(@sale.id.class).to eq Fixnum
    end
  end
  describe "self.all" do
    it "returns an array of Sale instances" do
      expect(FarMar::Sale.all).to be_an Array
    end
    it "returns an array with 12798 Sales instances" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
  end
  describe "self.find(id)" do
    it "returns the month of purchase for a particular sale" do
      @id = 12000
      expect(FarMar::Sale.find(@id).purchase_time.month).to eq 11
    end
    it "returns the corresponding product name for a particular sale" do
      @id = 11000
      @sale = FarMar::Sale.find(@id)
      expect(FarMar::Product.find(@sale.product_id).name). to eq "Fuzzy Burrito"
    end
  end
end
