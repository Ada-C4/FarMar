require "spec_helper"

describe Farmer::Product do
  before :each do
    @product = Farmer::Product.new
  end

  context "initializing" do
    it "returns a product object" do
      expect(@product).to be_an_instance_of Farmer::Product
    end
  end
end
