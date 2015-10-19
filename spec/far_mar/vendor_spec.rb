require "./spec/spec_helper"

describe "initialize" do
  before :each do
    @vendor = FarMar::Vendor.new
  end

  it "creates an instance of Farmar::Product class" do
    expect(@vendor).to be_an_instance_of FarMar::Vendor
  end
end
    
