require "spec_helper"
describe FarMar do
  describe FarMar::Product do

    before :each do
      product_info = ["1","Dry Beets","1"]
      @product = FarMar::Product.new(product_info)
      product3_info = ["3","Heavy Chicken","2"]
      @product3 = FarMar::Product.new(product3_info)
    end

    describe "#initialize" do
      it "creates a new instance of the Product class" do
        expect(@product).to be_an_instance_of(FarMar::Product)
      end
      it "retrieves the product ID from the product info array" do
        expect(@product.id).to eq(1)
      end
    end

    describe ".all" do
      before :each do
        @products = CSV.read("./support/products.csv")
      end
      it "returns an array" do
        expect(FarMar::Product.all).to be_an(Array)
      end
      it "returns an array with all the products" do
        expect(FarMar::Product.all.length).to eq(@products.size)
      end
      it "contains instances of the Product class" do
        product_total = FarMar::Product.all.length
        expect(FarMar::Product.all[0]).to be_an_instance_of(FarMar::Product)
        expect(FarMar::Product.all[product_total - 1]).to be_an_instance_of(FarMar::Product)
        expect(FarMar::Product.all[product_total]).to be nil
      end
    end

    describe ".find(id)" do
      before :each do
        @id = rand(1..8193)
      end
      it "returns an instance of Product" do
        expect(FarMar::Product.find(@id)).to be_an_instance_of(FarMar::Product)
      end
      it "returns the Product with the matching id" do
        expect(FarMar::Product.find(@id).id).to eq(@id)
      end
    end

    describe "#vendor" do
      it "returns an instance of the Vendor class" do
        expect(@product.vendor).to be_an_instance_of(FarMar::Vendor)
      end
      it "returns the Vendor with the matching id" do
        expect(@product.vendor_id).to eq(@product.vendor.id)
      end
    end

    describe "#sales" do
      it "returns a collection" do
        expect(@product.sales).to be_an(Array)
      end
      it "returns instances of Sales" do
        expect(@product.sales[0]).to be_an_instance_of(FarMar::Sale) if @product.sales.length > 0
      end
    end

    describe "#product_revenue" do
      it "returns a number" do
        expect(@product.product_revenue).to be_a(Fixnum)
      end
      it "calculates the total product revenue" do
        expect(@product.product_revenue).to eq(38259)
        expect(@product3.product_revenue).to eq(0)
      end
    end

    describe "#number_of_sales" do
      it "returns a number" do
        expect(@product.number_of_sales).to be_a(Fixnum)
      end
      it "returns the correct number of sales" do
        expect(@product.number_of_sales).to eq(7)
        expect(@product3.number_of_sales).to eq(0)
      end
    end

    describe ".by_vendor(vendor_id)" do
      before :each do
        @vendor_id = rand(1..2690)
      end
      it "returns a collection" do
        expect(FarMar::Product.by_vendor(@vendor_id)).to be_an(Array)
      end
      it "returns instances of Products" do
        expect(FarMar::Product.by_vendor(@vendor_id)[0]).to be_an_instance_of(FarMar::Product) if FarMar::Product.by_vendor(@vendor_id).length > 0
      end
    end

    ### can comment out below method to speed up specs ###
    # describe ".most_revenue(n)" do
    #   before :each do
    #     @n = 2
    #   end
    #   it "returns a collection" do
    #     expect(FarMar::Product.most_revenue(@n)).to be_an(Array)
    #   end
    #   it "returns a list of Products" do
    #     expect(FarMar::Product.most_revenue(2)[0]).to be_an_instance_of(FarMar::Product)
    #     expect(FarMar::Product.most_revenue(2)[1]).to be_an_instance_of(FarMar::Product)
    #   end
    #   it "is an ordered list" do
    #     expect(FarMar::Product.most_revenue(@n)[0].product_revenue).to be >= FarMar::Product.most_revenue(2)[1].product_revenue if FarMar::Product.most_revenue(2).length > 1
    #   end
    # end
    ### can comment out above method to speed up specs ###

  end
end
