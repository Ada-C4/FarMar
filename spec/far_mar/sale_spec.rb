require "spec_helper"

describe "creating a sale class" do
  before :each do
    @sale = FarMar::Sale.new
  end

  context "initializing" do
    it "returns a sale object" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
end