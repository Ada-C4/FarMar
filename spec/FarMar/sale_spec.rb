require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(1, 9290, "date", 1, 1)
  end

  describe ".new" do
      it "creates a new instance of Sale" do
        expect(@sale).to be_an_instance_of FarMar::Sale
      end
  end

  describe "self.all" do
    it "creates an array of instances of the Market class" do
      expect(FarMar::Sale.all).to be_an Array
    end
  end

  describe "self.findall" do
    it "returns an ID for a market passed in as a parameter" do
    twelve = FarMar::Sale.find(12)
      expect(twelve).to be_an_instance_of FarMar::Sale
      expect(twelve.id).to eq 12
    end
  end

  describe "vendor" do
    it "returns an array of vendors that are associated with a sale" do
      expect(@sale.vendor).to be_an Array
    end
    # it "returns the FarMar::Vendor instance associated with @sale" do
    #   @sale.vendor.each do |v|
    #     vendor.vendor_id == v.id
  end

  describe "product" do
    it "returns an array of products associated with the sale" do
      expect(@sale.product).to be_an Array
    end
  end

  describe "#self.between" do
    it "returns an array of sales" do
      expect(FarMar::Sale.between("2013-11-08 10:38:56 -0800","2013-11-08 10:39:26 -0800")).to be_an Array
    end
    it "returns a specific ID for a specific sale" do
      expect(FarMar::Sale.between("2013-11-08 10:38:56 -0800","2013-11-08 10:38:56 -0800")[0].id).to eq 39
    end
  end

end
