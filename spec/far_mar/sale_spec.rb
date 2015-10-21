require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(14, 4978, "2013-11-10 01:51:24 -0800", 3, 4)
    @sale_2 = FarMar::Sale.new(12001, 8923.0, "2013-11-12 02:03:31 -0800", 2690, 8192)
  end

  context "initializing" do
    it "returns a sale object" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  context ".self.all" do
    it "returns an array" do
      expect(FarMar::Sale.all().class).to be Array
    end
    it "returns instances of all lines in the csv" do
      expect(FarMar::Sale.all().length).to eq 12798
    end
  end

  context ".self.find(id)" do
    it "returns an instance of Sale" do
      expect(@sale.class).to be FarMar::Sale
    end

    it "returns an instance with the same id as the value in the CSV file" do
      expect(@sale.id).to eq 14
      expect(@sale_2.id).to eq 12001
    end
  end
end
