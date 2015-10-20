require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new
  end
  describe "#initialize" do
    it "creates a new instance" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe "self.all" do
    it "creates an array of sales" do
      expect(FarMar::Sale.all).to be_an Array
    end
  end

  describe "self.find" do
    it "returns an instance of Sale where the value of the id field in the CSV matches the passed parameter" do
      result = FarMar::Sale.find(3)
      expect(result).to be_an Object
      expect(result.sale_id).to eq 3
    end
  end

end
