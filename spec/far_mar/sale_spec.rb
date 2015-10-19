require "spec_helper"
describe FarMar do
  describe FarMar::Sale do

    describe ".new" do
      before :each do
        @sale = FarMar::Sale.new
      end
      it "creates a new instance of the Sale class" do
        expect(@sale).to be_an_instance_of(FarMar::Sale)
      end
    end

    describe ".all" do
      before :each do
        @sales = CSV.read("./support/sales.csv")
      end
      it "returns an array" do
        expect(FarMar::Sale.all).to be_an(Array)
      end
      it "returns an array with the vendor info" do
        expect(FarMar::Sale.all.length).to eq(@sales.size)
      end
    end

  end
end
