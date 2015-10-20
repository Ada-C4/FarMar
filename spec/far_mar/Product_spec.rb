require 'spec_helper'
describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new("1", "Dry", "Beets")
  end
  describe "#new" do
    it "creates a new Product instance" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
  describe "#all" do
    it "creates new Product instances" do
      expect(FarMar::Product.all[0].name).to eq "Dry Beets"
    end
    it "returns a collection representing all the products in the CSV" do
      expect(FarMar::Product.all.length).to eq 8193
    end
  end
end
