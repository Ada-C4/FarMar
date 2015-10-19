require "./spec/spec_helper"

describe "initialize" do
  before :each do
    @product = FarMar::Product.new
  end

  it "creates an instance of Farmar::Product class" do
    expect(@product).to be_an_instance_of FarMar::Product
  end
end
