require "spec_helper"

describe FarMar do
  describe FarMar::Sale do
    describe "initialize" do
      it "creates an instance of a Sale" do
        @sale_hash = {
        :id => 123,
        :amount => 150,
        :purchase_time => DateTime.parse("2013-11-07 14:41:55 -0800"),
        :vendor_id => 456,
        :product_id => 123
        }
        expect(FarMar::Sale.new(@sale_hash)).to be_an_instance_of FarMar::Sale
      end
    end

    describe "self.all" do
      it "returns an array" do
        expect(FarMar::Sale.all).to be_an Array
      end
    end

    describe "self.find" do
      it "returns an instance of sale" do
        num = rand(1..12001)
        expect(FarMar::Sale.find(num)).to be_an_instance_of FarMar::Sale
      end
      it "returns an instance of sale with the correct ID" do
        num = 1
        sale = FarMar::Sale.find(num)
        expect(sale.id).to eq 1
      end
    end

    describe "find_vendor" do
      before :each do
        @sale = FarMar::Sale.new({
          :id => 123,
          :amount => 150,
          :purchase_time => DateTime.parse("2013-11-07 14:41:55 -0800"),
          :vendor_id => 456,
          :product_id => 123
        })
      end
      it "returns an instance of Vendor" do
        expect(@sale.find_vendor(@sale.id)).to be_an_instance_of FarMar::Vendor
      end
    end

    describe "find_product" do
      before :each do
        @sale = FarMar::Sale.new({
          :id => 123,
          :amount => 150,
          :purchase_time => DateTime.parse("2013-11-07 14:41:55 -0800"),
          :vendor_id => 456,
          :product_id => 123
        })
      end
      it "returns an instance of Product" do
        expect(@sale.find_product(@sale.id)).to be_an_instance_of FarMar::Product
      end
    end

    describe "self.between" do
      before :each do
        @beginning = DateTime.parse("2013-11-12 06:03:54 -0800")
        @ending_time = DateTime.parse("2013-11-12 14:38:29 -0800")
      end
      it "returns an array" do
        expect(FarMar::Sale.between(@beginning,@ending_time)).to be_an Array
      end
      it "has instances of Sale in the array" do
        expect(FarMar::Sale.between(@beginning,@ending_time)[0]).to be_an_instance_of FarMar::Sale
      end
    end
  end
end
