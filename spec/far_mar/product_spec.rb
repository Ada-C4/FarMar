require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

  describe "self.all" do
    it "creates an array of products" do
      expect(FarMar::Product.all).to be_an Array
    end
  end

  describe "self.find" do
    it "returns an instance of Product where the value of the id field in the CSV matches the passed parameter" do
      result = FarMar::Product.find(3)
      expect(result).to be_an Object
      expect(result.product_id).to eq 3
    end
  end


end
