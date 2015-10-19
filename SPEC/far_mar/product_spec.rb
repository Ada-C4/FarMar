require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new("cherries")
  end

  describe "self.new(name)" do
    it "creates a new instance of Market" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end
end
