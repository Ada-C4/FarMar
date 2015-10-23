require "spec_helper"

describe FarMar do
  describe FarMar::Sale do
    before :all do
      @sale_hash = {
      :id => 123,
      :amount => 150,
      :purchase_time => DateTime.parse("2013-11-07 14:41:55 -0800"),
      :vendor_id => 456,
      :product_id => 123
      }
      @sale = FarMar::Sale.new({
        :id => 123,
        :amount => 150,
        :purchase_time => DateTime.parse("2013-11-07 14:41:55 -0800"),
        :vendor_id => 456,
        :product_id => 123
      })
    end

    describe "initialize" do
      it "creates an instance of a Sale" do
        expect(FarMar::Sale.new(@sale_hash)).to be_an_instance_of FarMar::Sale
      end
    end

    describe "self.all" do
      it "returns an array" do
        expect(FarMar::Sale.all).to be_an Array
      end
      it "has Sale instances in the array" do
        expect(FarMar::Sale.all[0]).to be_an_instance_of FarMar::Sale
      end
      it "has the correct number of Sale instances in the array" do
        expect(FarMar::Sale.all.length).to eq 12798
      end
    end

    describe "self.find" do
      it "returns an instance of sale" do
        num = rand(11000..12001)
        puts num
        expect(FarMar::Sale.find(num)).to be_an_instance_of FarMar::Sale
      end
      it "returns an instance of sale with the correct ID" do
        num = 1
        sale = FarMar::Sale.find(num)
        expect(sale.id).to eq 1
      end
      it "returns nil if the argument is not a Fixnum" do
        expect(FarMar::Sale.find("abc")).to be_nil
        expect(FarMar::Sale.find(1.24)).to be_nil
        expect(FarMar::Sale.find(:id)).to be_nil
      end
      it "returns nil if passed a Fixnum that isn't a valid ID" do
        expect(FarMar::Sale.find(-1)).to be_nil
      end
    end

    describe "find_vendor" do
      it "returns an instance of Vendor" do
        expect(@sale.find_vendor(@sale.id)).to be_an_instance_of FarMar::Vendor
      end
      it "returns a Vendor object which has a vendor id that matches the sale's vendor id" do
        num = 1
        vendor = @sale.find_vendor(num)
        expect(vendor.id).to eq num
      end
      it "returns nil if the argument is not a Fixnum" do
        expect(@sale.find_vendor("abc")).to be_nil
        expect(@sale.find_vendor(1.24)).to be_nil
        expect(@sale.find_vendor(:id)).to be_nil
      end
      it "returns nil if passed a Fixnum that isn't a valid ID" do
        expect(@sale.find_vendor(-1)).to be_nil
      end
    end

    describe "find_product" do
      it "returns an instance of Product" do
        expect(@sale.find_product(@sale.id)).to be_an_instance_of FarMar::Product
      end
      it "returns a Product object which has a product id that matches the Sale's product id" do
        num = 1
        product = @sale.find_product(num)
        expect(product.id).to eq num
      end
      it "returns nil if the argument is not a Fixnum" do
        expect(@sale.find_product("abc")).to be_nil
        expect(@sale.find_product(1.24)).to be_nil
        expect(@sale.find_product(:id)).to be_nil
      end
      it "returns nil if passed a Fixnum that isn't a valid ID" do
        expect(@sale.find_product(-1)).to be_nil
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
      # it "returns an empty array given an invalid argument" do
      #   expect(FarMar::Sale.between(1,2)).to eq []
      # end
    end
  end
end
