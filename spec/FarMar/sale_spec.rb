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

  describe "#self.between" do
    it "returns an array of sales" do
      expect(FarMar::Sale.between("2013-11-08 10:38:56 -0800","2013-11-13 01:48:15 -0800")).to be_an Array
      expect(FarMar::Sale.between(give a specific instance and have it expect a specific id number_of_sales
      # by giving it a specific index[0]))
    end
  end



end



##.products is a method in the vendor spec.
#goes through the specific instance of vendor, looks at all
#the products. if the individual product has a vendor ID
#that matches the product, ID, return
  # DELETEit "has a product ID that matches the vendor ID" do
  #   @vendor.products.each do |product|
  #     product.vendor_id == product.id
  #   end
