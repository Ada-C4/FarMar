require "./spec/spec_helper"

describe "initialize" do
  before :each do
    @product = FarMar::Product.new(1, "Dry Beets", 1)
    @product2 = FarMar::Product.new(58, "Thoughtless Honey", 20)
  end

  it "creates an instance of Farmar::Product class" do
    expect(@product).to be_an_instance_of FarMar::Product
  end

  describe "#self.all" do
    it "returns an Array" do
      expect(FarMar::Product.all).to be_an_instance_of Array
    end
    it "returns all 8193 instances in csv file" do
      expect(FarMar::Product.all.length).to eq 8193
    end
    it "returns instances of FarMar::Product" do
      expect(FarMar::Product.all[0].id).to eq 1
      expect(FarMar::Product.all[0].name).to eq "Dry Beets"
      expect(FarMar::Product.all[0].vendor_id).to eq 1
    end
  end

  describe "#self.find" do
    it "returns the FarMar::Product with the specified id" do
      expect(FarMar::Product.find(2)).to be_an_instance_of FarMar::Product
      expect(FarMar::Product.find(2).name).to eq "Fierce Greens"
    end
  end

  describe "#vendor" do
    it "returns the Farmar::Vendor instance that is associated with the specific Product" do
      expect(@product.vendor).to be_an_instance_of FarMar::Vendor
      expect(@product.vendor.name).to eq "Feil-Farrell"
      expect(@product2.vendor.name).to eq "Ledner Group"
    end
  end

  describe "#sales" do
    it "returns all FarMar::Sale instances associated with the specific Product" do
      expect(@product.sales.length).to eq 7
      expect(@product.sales[0].id).to eq 1
      expect(@product2.sales.length).to eq 5
      expect(@product2.sales[0].id).to eq 101
    end
  end

end
