require "./spec/spec_helper.rb"

describe FarMar::Sales do
  describe "initialize"
    sale = Sales.new
    it "creates a new instace of the sale class" do
      expect(sale).to be_an_instance_of Sales
    end
end
