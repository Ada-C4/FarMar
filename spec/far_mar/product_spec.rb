require "spec_helper"

describe FarMar::Product do
  before :each do
    @product = FarMar::Product.new({
      id: "56",
      name: "Nom nom Beef",
      vendor_id: "19"
      })
  end

  describe ".new" do
    it "creates a new instance of Product" do
      expect(@product).to be_an_instance_of FarMar::Product
    end
  end

end
