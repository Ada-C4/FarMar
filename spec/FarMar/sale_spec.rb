require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new("id", "amount", "purchase_time", "vendor_id", "product_id")
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
    it "returns FarMar::Vendor instances that are associated with a sale" do

  end

end
