require "spec_helper"

describe FarMar do
  describe FarMar::Sale do
    before :each do
      #@sale = FarMar::Sale.new
    end

    describe "#initialize" do
      it "creates a new instance of Sale" do
        fake_hash = {:id => 6, :amount => 150, :purchase_time => "2013-11-10 18:56:53 -0800", :vendor_id => 555, :product_id => 4}
        test = FarMar::Sale.new(fake_hash)
        expect(test).to be_an_instance_of FarMar::Sale
      end
    end

    describe '#self.all' do
      it "returns a collection of Sale instances" do
        expect(FarMar::Sale.all.length).to eq CSV.read("support/sales.csv").length
      end
    end

    describe "self.find(id)" do
      it "returns specific instance of Sale" do
        find_test = FarMar::Sale.find(15)
        expect(find_test.product_id).to eq 4
      end
    end

    describe "self.between(start,stop)" do
      it "returns array of sale instances" do
        time_test = FarMar::Sale.between?("2013-11-10 08:56:53 -0800","2013-11-10 08:59:53 -0800")
        expect(time_test.length).to eq 2
      end

      it "returns array of sale instances" do
        time_test = FarMar::Sale.between?("2010-11-10 08:56:53 -0800","2014-11-10 08:59:53 -0800")
        expect(time_test.length).to eq 12798
      end
    end

    describe "list_vendors" do
      it "returns specific vendor instance" do
        vendor_test = FarMar::Sale.find(455)
        expect(vendor_test.list_vendors.name).to eq "Moen, Thiel and Osinski"
      end
    end

    describe "list_products" do
      it "returns specific product instance" do
        product_test = FarMar::Sale.find(413)
        expect(product_test.list_products.name).to eq "– Mushrooms"
      end
    end



  end
end
