require "spec_helper"
describe FarMar do
  describe FarMar::Sale do

    before :each do
      sale_info = CSV.open("./support/sales.csv", 'r') { |csv| csv.first }
      @sale = FarMar::Sale.new(sale_info)
    end

    describe "#initialize" do
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

    describe ".find(id)" do
      before :each do
        @id = rand(1..12001)
      end
      it "returns an instance of Sale" do
        expect(FarMar::Sale.find(@id)).to be_an_instance_of(FarMar::Sale)
      end
      it "returns the Sale with the matching id" do
        expect(FarMar::Sale.find(@id).id).to eq(@id)
      end
    end

    describe "#vendor" do
      it "returns an instance of the Vendor class" do
        expect(@sale.vendor).to be_an_instance_of(FarMar::Vendor)
      end
      it "returns the Vendor with the matching id" do
        expect(@sale.vendor_id).to eq(@sale.vendor.id)
      end
    end

    describe "#product" do
      it "returns an instance of the Product class" do
        expect(@sale.product).to be_an_instance_of(FarMar::Product)
      end
      it "returns the Product with the matching id" do
        expect(@sale.product_id).to eq(@sale.product.id)
      end
    end

    describe ".between(beginning_time, end_time)" do
      before :each do
        @beginning_time = DateTime.strptime("2013-11-06 08:35:40 -0800", "%Y-%m-%d %H:%M:%S %z")
        @end_time = DateTime.strptime("2013-11-13 08:35:16 -0800", "%Y-%m-%d %H:%M:%S %z")
      end
      it "returns a collection" do
        expect(FarMar::Sale.between(@beginning_time, @end_time)).to be_an(Array)
      end
      it "returns instances of the Sale class" do
        expect(FarMar::Sale.between(@beginning_time, @end_time)[0]).to be_an_instance_of(FarMar::Sale) if FarMar::Sale.between(@beginning_time, @end_time).length > 0
      end
      it "returns the correct number of Sale instances" do
        expect(FarMar::Sale.between(@beginning_time, @end_time).length).to eq(12798)
      end
    end

  end
end
