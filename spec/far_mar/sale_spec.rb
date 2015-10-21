require "spec_helper"

describe FarMar do
  describe FarMar::Sale do
    before :each do
      #@sale = FarMar::Sale.new
    end

    describe "#initialize" do
      it "creates a new instance of Sale" do
        fake_hash = {:id => 6, :amount => 150, :purchase_time => "2007-01-31 12:22:26", :vendor_id => 555, :product_id => 4}
        test = FarMar::Sale.new(fake_hash)
        expect(test).to be_an_instance_of FarMar::Sale
      end
    end

    describe '#self.all' do
      it "returns a collection of Sale instances" do
        expect(FarMar::Sale.all.length).to eq CSV.read("support/sales.csv").length
      end
    end
  end
end
