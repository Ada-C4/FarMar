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
    it "returns an array" do
      expect(FarMar::Sale.all).to be_an Array
    end
    it "creates an array containing Sales instances" do
      expect(FarMar::Sale.all[0]).to be_an_instance_of FarMar::Sale
    end
  end
  describe "self.find(id)" do
    it "returns the name of the product sold" do
      @id = 11000
      @sale = FarMar::Sale.find(@id)
      expect(FarMar::Product.find(@sale.product_id)).to be_an_instance_of FarMar::Product
    end
  end
  describe "#vendor" do
    it "returns a Vendor instance associated with the sale" do
      @id = 2
      expect(FarMar::Sale.find(@id).vendor).to be_an_instance_of FarMar::Vendor
      expect(FarMar::Sale.find(@id).vendor.id).to eq 1
    end
  end
  describe "#product" do
    it "returns a Product instance associated with the sale" do
      @id = 2
      expect(FarMar::Sale.find(@id).product).to be_an_instance_of FarMar::Product
      expect(FarMar::Sale.find(@id).product.id).to eq 1
    end
  end
  describe "self.between(beginning_time, end_time)" do
    it "returns an array" do
      @beginning_time = "2013-11-07 04:34:56 -0800"
      @end_time = "2013-11-10 11:31:16 -0800"
      expect(FarMar::Sale.between(@beginning_time, @end_time)).to be_an Array
      @end_time = @beginning_time
      expect(FarMar::Sale.between(@beginning_time, @end_time)).to be_an Array
    end
  end
end
