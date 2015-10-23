require 'spec_helper'
describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new("3339", "7316", "2013-11-11 13:56:55 -0800", "742", "2213")
  end
  describe "#new" do
    it "creates a new Sale instance" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end
  describe "#all" do
    it "creates new Sale instances" do
      expect(FarMar::Sale.all[1].amount).to eq 2262
    end
    it "returns a collection representing all sales in the CSV" do
      expect(FarMar::Sale.all.length).to eq 12798
    end
  end
  describe "#find(id)" do
    it "returns the sales instance with an id matching the parameter" do
      expect(FarMar::Sale.find(20).id).to eq 20
    end
  end
  describe ".vendor" do
    it "returns the vendor instance whose id matches the sale's vendor_id" do
      expect(@sale.vendor.id).to eq 742
    end
  end
  describe ".product" do
    it "returns the product instance whose id matches the sales's product_id" do
      expect(@sale.product.id).to eq 2213
    end
  end
  describe "#between(beginning_time, end_time)" do
    context "when beginning_time is before end_time" do
      begin_time = "2013-11-06 08:47:12 -0800"
      end_time = "2013-11-06 08:52:59 -0800"
      it "returns a collection of sales instances" do
        expect(FarMar::Sale.between(begin_time, end_time)[1].class).to eq FarMar::Sale
      end
      it "returns all sales that occurred between beginning_time and end_time (exclusive)" do
        expect(FarMar::Sale.between(begin_time, end_time).length).to eq 4
        expect(FarMar::Sale.between(begin_time, end_time)[1].id).to eq 4119
      end
    end
    context "when end_time is before beginning_time" do
      it "returns an empty array" do
        begin_time = "2013-11-06 08:52:59 -0800"
        end_time = "2013-11-06 08:47:12 -0800"
        expect(FarMar::Sale.between(begin_time, end_time)).to eq []
      end
    end
    context "when beginning_time and end_time are the same" do
      it "returns an empty array" do
        begin_time = "2013-11-06 08:47:12 -0800"
        end_time = "2013-11-06 08:47:12 -0800"
        expect(FarMar::Sale.between(begin_time, end_time)).to eq []
      end
    end
  end
end
