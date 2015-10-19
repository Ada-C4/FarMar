require "./spec/spec_helper.rb"
require "./lib/far_mar/sale_class.rb"

describe FarMar::Sale do
  describe "initialize"
  before :each do
    @sale_test = FarMar::Sale.new
  end
    it "creates a new instace of the sale class" do
      expect(@sale_test).to be_an_instance_of FarMar::Sale
    end
end
