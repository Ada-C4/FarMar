require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new(11,1030,"2013-11-10 18:56:53 -0800",3,4)
  end

  describe "initialize Sale" do
    it "creat a new sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

  describe ".all" do
    it "returns a collection of Sale instances" do
      expect(FarMar::Sale.all).to be_an(Array)
    end
  end

  describe "find" do
    it "return the sale, usind id " do
      expect(FarMar::Sale.find(11).amount).to eq(1030)
    end
  end

  describe "by_vendor" do
    before :each do
      @sale_array = FarMar::Sale.by_vendor(1)
    end

    it "return an array of sales " do
    expect(@sale_array).to be_an(Array)
    end

    it "return an array by vendor id" do
      expect(@sale_array[0].id).to eq 1
    end
  end

end
