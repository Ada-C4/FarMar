require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new("1","Dry Beets","1")
  end

  describe ".new" do
      it "creates a new instance of Product" do
        expect(@product).to be_an_instance_of FarMar::Product
      end
  end

  describe "self.all" do
    it "creates an array of instances of the Product class" do
    expect(FarMar::Product.all).to be_an Array
    end
  end

  describe "self.findall" do
    it "returns an ID for a market passed in as a parameter" do
      twelve = FarMar::Product.find(12)
    expect(twelve).to be_an_instance_of FarMar::Product
    expect(twelve.id).to eq 12
    end
  end  
end
