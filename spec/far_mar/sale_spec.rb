require "spec_helper"
describe FarMar do
  describe FarMar::Sale do

    describe "#initialize" do
      before :each do
        sale_info = CSV.open("./support/sales.csv", 'r') { |csv| csv.first }
        @sale = FarMar::Sale.new(sale_info)
      end
      it "creates a new instance of the Sale class" do
        expect(@sale).to be_an_instance_of(FarMar::Sale)
      end
      it "retrieves the sale ID from the sale info array" do
        expect(@sale.id).to eq(1)
      end
    end

    describe ".all" do
      before :each do
        @sales = CSV.read("./support/sales.csv")
      end
      it "returns an array" do
        expect(FarMar::Sale.all).to be_an(Array)
      end
      it "returns an array with all the sales" do
        expect(FarMar::Sale.all.length).to eq(@sales.size)
      end
      it "contains instances of the Sale class" do
        vendor_total = FarMar::Sale.all.length
        expect(FarMar::Sale.all[0]).to be_an_instance_of(FarMar::Sale)
        expect(FarMar::Sale.all[vendor_total - 1]).to be_an_instance_of(FarMar::Sale)
        expect(FarMar::Sale.all[vendor_total]).to be nil
      end
    end

  end
end
