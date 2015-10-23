require 'spec_helper'

describe FarMar do
  describe FarMar::Vendor do
    vendor_hash = FarMar::Vendor.convert_to_hash(["70","Eichmann Group","8","16"])
    let(:sample_vendor) { FarMar::Vendor.new(vendor_hash) }
    describe "#initialize" do
      it "creates a new Vendor instance" do
        expect(sample_vendor).to be_an_instance_of(FarMar::Vendor)
      end
      vendor_hash.each do |attr, val|
        it "assigns the #{attr} attribute correctly" do
          expect(sample_vendor.instance_variable_get("@#{attr}")).to eq(val)
        end
      end
    end
    describe "self.all" do
      it "returns an array of 2690 Vendor objects" do
        FarMar::Vendor.all
        expect(FarMar::Vendor.all_objects).to be_an(Array)
        expect(FarMar::Vendor.all_objects.length).to eq(2690)
        expect(FarMar::Vendor.all_objects[0].id).to eq(1)
        expect(FarMar::Vendor.all_objects[-1].id).to eq(2690)
      end
    end

    describe ".find(id)" do
      it "returns Vendor object for matching ID" do
        result = FarMar::Vendor.find(2690)
        expect(result).to be_an_instance_of(FarMar::Vendor)
        expect(result.id).to eq(2690)
        expect(result.name).to eq("Mann-Lueilwitz")
        expect(result.emp_num).to eq(4)
        expect(result.market_id).to eq(500)
      end
    end

    describe ".by_market(market_id)" do
      it "returns empty array for an invalid market_id" do
        expect(FarMar::Vendor.by_market('a')).to eq([])
        expect(FarMar::Vendor.by_market([1, 2])).to eq([])
        expect(FarMar::Vendor.by_market(-5)).to eq([])
        expect(FarMar::Vendor.by_market(999999999999)).to eq([])
      end
      it "returns all the vendors with the given market_id" do
        vendors = FarMar::Vendor.by_market(12)
        expect(vendors).to be_an_instance_of(Array)
        expect(vendors.length).to eq(3)
        expect(vendors[0].id).to eq(51)
      end
    end

    describe ".most_revenue(n)" do
      it "returns an empty array when n is invalid" do
        expect(FarMar::Vendor.most_revenue(-1)).to eq([])
        expect(FarMar::Vendor.most_revenue('a')).to eq([])
        expect(FarMar::Vendor.most_revenue(9999999999999999)).to eq([])
      end
      it "returns the top n vendor instances ranked by total revenue" do
        top_revenue = FarMar::Vendor.most_revenue(1)
        top_five = FarMar::Vendor.most_revenue(5)
        expect(top_revenue).to be_an_instance_of(Array)
        expect(top_revenue[0].revenue).to eq(123474)
        expect(top_five).to be_an_instance_of(Array)
        expect(top_five.length).to eq(5)
        expect(top_five[0].revenue).to eq(123474)
        expect(top_five[-1].revenue).to eq(107516)
      end
    end

    describe ".most_items(n)" do
      it "returns an empty array when n is invalid" do
        expect(FarMar::Vendor.most_items(-1)).to eq([])
        expect(FarMar::Vendor.most_items('a')).to eq([])
        expect(FarMar::Vendor.most_items(9999999999999999)).to eq([])
      end
      it "returns the top n vendor instances ranked by number of items sold" do
        top_item = FarMar::Vendor.most_items(1)
        top_thirty = FarMar::Vendor.most_items(30)
        expect(top_item).to be_an_instance_of(Array)
        expect(top_item.length).to eq(1)
        expect(top_item[0].num_sales).to eq(18)
        expect(top_thirty).to be_an_instance_of(Array)
        expect(top_thirty.length).to eq(30)
        expect(top_thirty[-1].num_sales).to eq(17)
      end
    end

    describe ".find_by_name(match)" do
      it "returns nil for no match" do
        expect(FarMar::Vendor.find_by_name(3)).to be_nil
        expect(FarMar::Vendor.find_by_name('xxxxxxxxxx')).to be_nil
        expect(FarMar::Vendor.find_by_name([])).to be_nil
      end
      it "returns a single instance for matching the attribute" do
        expect(FarMar::Vendor.find_by_name('Von-Hamill').id).to be(18)
        expect(FarMar::Vendor.find_by_name('von-hamill').id).to be(18)
      end
    end

    describe "#products" do
      it "returns a collection of Products with the vendor's ID" do
        products = sample_vendor.products
        expect(products).to be_an(Array)
        expect(products.length).to eq(5)
        expect(products[0].id).to eq(221)
        expect(products[-1].name).to eq("Cheerful Bread")
      end
    end

    describe "#sales" do
      it "returns a collection of Sales with the vendor's ID" do
        sales = sample_vendor.sales
        expect(sales).to be_an(Array)
        expect(sales.length).to eq(7)
        expect(sales[0].id).to eq(313)
        expect(sales[-1].id).to eq(319)
      end
    end

    describe "#market" do
      it "returns the market associated with the vendor" do
        sample_market = sample_vendor.market
        expect(sample_market).to be_an_instance_of(FarMar::Market)
        expect(sample_market.id).to eq(sample_vendor.market_id)
        expect(sample_market.name).to eq("Riverside Farmers' Market")
      end
    end

    describe "#revenue" do
      it "returns the sum of all the vendor's sales" do
        expect(sample_vendor.revenue).to eq(17211)
      end
    end

    describe "#day_revenue(date)" do
      it "returns 0 for invalid date" do
        expect(sample_vendor.day_revenue(123)).to eq(0)
        expect(sample_vendor.day_revenue('abc')).to eq(0)
      end
      it "returns the total revenue for the vendor on the given date" do
        date1 = DateTime.parse("2013-11-12T13:07:19-08:00")
        date2 = DateTime.parse("2013-11-10T15:40:57-08:00")
        date3 = DateTime.parse("2013-11-08T07:41:09-08:00")
        date4 = DateTime.parse("2013-11-09T07:41:09-08:00")
        expect(sample_vendor.day_revenue(date1)).to eq(1135)
        expect(sample_vendor.day_revenue(date2)).to eq(7225)
        expect(sample_vendor.day_revenue(date3)).to eq(4733)
        expect(sample_vendor.day_revenue(date4)).to eq(0)
      end
    end

    describe ".revenue_on(date)" do
      it "returns 0 for invalid dates" do
        expect(FarMar::Vendor.revenue_on(123)).to eq(0)
        expect(FarMar::Vendor.revenue_on('abc')).to eq(0)
      end
      it "returns the total revenue for the date across all vendors" do
        date1 = DateTime.parse("2013-11-12T13:07:19-08:00")
        date2 = DateTime.parse("2013-11-10T15:40:57-08:00")
        match1 = FarMar::Vendor.revenue_on(date1)
        match2 = FarMar::Vendor.revenue_on(date2)
        # date3 = DateTime.parse("2013-11-08T07:41:09-08:00")
        # date4 = DateTime.parse("2013-11-09T07:41:09-08:00")
        expect(match1).to be_an_instance_of(Fixnum)
        expect(match1).to eq(8871052)
        expect(match2).to be_an_instance_of(Fixnum)
        expect(match2).to eq(9119618)
      end
    end
  end
end
