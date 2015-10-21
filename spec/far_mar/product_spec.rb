require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new(12, "Gorgeous Fish", 6)
  end

  context "initializing" do
    it "returns a product object" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  context ".self.all" do
    it "returns an array" do
      expect(FarMar::Product.all().class).to be Array
    end
    it "returns instances of all lines in vendors.csv" do
      expect(FarMar::Product.all().length).to eq 8193
    end
  end



end
