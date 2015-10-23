require "spec_helper"

describe FarMar do
  describe FarMar::Product do
    before :all do
      @product_hash = {
      :id => 123,
      :name => "product name",
      :vendor_id => 456
      }
      @product = FarMar::Product.new({
        :id => 1,
        :name => "product name",
        :vendor_id => 456
      })
    end

    describe "initialize" do
      it "creates an instance of a Product" do
        expect(FarMar::Product.new(@product_hash)).to be_an_instance_of FarMar::Product
      end
    end

      describe "self.all" do
        it "returns an array" do
          expect(FarMar::Product.all).to be_an Array
        end
        it "has Product instances in the array" do
          expect(FarMar::Product.all[0]).to be_an_instance_of FarMar::Product
        end
        it "has the correct number of Product instances in the array" do
          expect(FarMar::Product.all.length).to eq 8193
        end
      end

      describe "self.find" do
        it "returns an instance of Product" do
          num = rand(1..8193)
          expect(FarMar::Product.find(num)).to be_an_instance_of FarMar::Product
        end
        it "returns an instance of product with the correct ID" do
          num = 1
          product = FarMar::Product.find(num)
          expect(product.id).to eq 1
        end
        it "returns nil if the argument is not a Fixnum" do
          expect(FarMar::Product.find("abc")).to be_nil
          expect(FarMar::Product.find(1.24)).to be_nil
          expect(FarMar::Product.find(:id)).to be_nil
        end
        it "returns nil if passed a Fixnum that isn't a valid ID" do
          expect(FarMar::Product.find(-1)).to be_nil
        end
      end

      describe "find_vendor" do
        it "returns an instance of Vendor" do
          expect(@product.find_vendor(@product.id)).to be_an_instance_of FarMar::Vendor
        end
        it "returns a Vendor object which has a vendor id that matches the product's vendor id" do
          num = 1
          vendor = @product.find_vendor(num)
          expect(vendor.id).to eq num
        end
        it "returns nil if the argument is not a Fixnum" do
          expect(@product.find_vendor("abc")).to be_nil
          expect(@product.find_vendor(1.24)).to be_nil
          expect(@product.find_vendor(:id)).to be_nil
        end
        it "returns nil if passed a Fixnum that isn't a valid ID" do
          expect(@product.find_vendor(-1)).to be_nil
        end
      end

      describe "find_sales" do
        it "returns an array" do
          expect(@product.find_sales(@product.id)).to be_an Array
        end
        it "has Sale items in the array" do
          expect(@product.find_sales(@product.id)[0]).to be_an_instance_of FarMar::Sale
        end
        it "has Sale items that contain the correct product_id" do
          expect(@product.find_sales(@product.id)[0].purchase_time).to eq DateTime.parse("2013-11-07 04:34:56 -0800")
        end
        it "returns empty Array if the argument is not a Fixnum" do
          expect(@product.find_sales("abc")).to eq []
          expect(@product.find_sales(1.24)).to eq []
          expect(@product.find_sales(:id)).to eq []
        end
        it "returns empty Array if passed a Fixnum that isn't a valid ID" do
          expect(@product.find_sales(-1)).to eq []
        end
      end

      describe "number_of_sales" do
        it "returns an integer" do
          expect(@product.number_of_sales(@product.id)).to be_a Fixnum
        end
        it "returns the correct number of Sales" do
          expect(@product.number_of_sales(@product.id)).to eq 7
        end
        it "returns 0 if the argument is not a Fixnum" do
          expect(@product.number_of_sales("abc")).to eq 0
          expect(@product.number_of_sales(1.24)).to eq 0
          expect(@product.number_of_sales(:id)).to eq 0
        end
        it "returns 0 if passed a Fixnum that isn't a valid ID" do
          expect(@product.number_of_sales(-1)).to eq 0
        end
      end

      describe "self.by_vendor" do
        it "returns an array" do
          expect(FarMar::Product.by_vendor(1)).to be_an Array
        end
        it "has Product instances in the array" do
          expect(FarMar::Product.by_vendor(1)[0]).to be_an_instance_of FarMar::Product
        end
        it "returns an empty Array if the argument is not a Fixnum" do
          expect(FarMar::Product.by_vendor("abc")).to eq []
          expect(FarMar::Product.by_vendor(1.24)).to eq []
          expect(FarMar::Product.by_vendor(:id)).to eq []
        end
        it "returns an empty Array if passed a Fixnum that isn't a valid ID" do
          expect(FarMar::Product.by_vendor(-1)).to eq []
        end
      end
  end
end
