require "./spec/spec_helper"

describe "initialize" do
  before :each do
    @market = FarMar::Market.new
  end

  it "creates an instance of Farmar::Market class" do
    expect(@market).to be_an_instance_of FarMar::Market
  end
end
