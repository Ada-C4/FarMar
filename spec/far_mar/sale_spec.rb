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

  describe "between" do
    it "returns an array of sales" do
      beginning_time = DateTime.strptime("2013-11-06 08:35:40 -0800", "%Y-%m-%d %H:%M:%S %z")
      end_time = DateTime.strptime("2013-11-08 16:36:03 -0800", "%Y-%m-%d %H:%M:%S %z" )
      expect(FarMar::Sale.between(beginning_time, end_time)).to be_an_instance_of(Array)
    end
    it "purchases between the two times" do
      beginning_time = DateTime.strptime("2013-11-13 01:48:37 -0800", "%Y-%m-%d %H:%M:%S %z")
      end_time = DateTime.strptime("2013-11-13 01:50:37 -0800", "%Y-%m-%d %H:%M:%S %z" )
      sale = FarMar::Sale.between(beginning_time, end_time)
      expect(sale[0].id).to eq(3)
    end
  end

  describe "vendor" do
    it "return the vendor the associated with the sale" do
      expect(@sale.vendor.name).to eq("Breitenberg Inc")
    end

  end
end
