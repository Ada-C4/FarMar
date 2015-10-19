require "./spec/spec_helper"

describe "initialize" do
  before :each do
    @sale = FarMar::Sale.new
  end

  it "creates an instance of Farmar::Sale class" do
    expect(@sale).to be_an_instance_of FarMar::Sale
  end
end
