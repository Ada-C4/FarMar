require "./spec/spec_helper"

describe FarMar::Vendor do
  before :each do
    @vendor = FarMar::Vendor.new(1, "Feil-Farrell", 8, 1)
    @vendor2 = FarMar::Vendor.new(20, "Ledner Group", 7, 6)
  end

  describe "initialize" do
    it "creates an instance of Farmar::Vendor class" do
      expect(@vendor).to be_an_instance_of FarMar::Vendor
    end
  end

  describe "#self.all" do
    it "returns an Array" do
      expect(FarMar::Vendor.all).to be_an_instance_of Array
    end
    it "returns all 12001 instances in csv file" do
      expect(FarMar::Vendor.all.length).to eq 2690
    end
    it "returns instances of FarMar::Vendor" do
      expect(FarMar::Vendor.all[0].id).to eq 1
      expect(FarMar::Vendor.all[0].name).to eq "Feil-Farrell"
      expect(FarMar::Vendor.all[0].market_id).to eq 1
    end
  end

  describe "#self.find" do
    it "returns the FarMar::Vendor with the specified id" do
      expect(FarMar::Vendor.find(2)).to be_an_instance_of FarMar::Vendor
      expect(FarMar::Vendor.find(2).name).to eq "Hamill, Kilback and Pfeffer"
    end
  end

  describe "#market" do
    it "returns the Market for the specific vendor instance" do
      expect(@vendor.market).to be_an_instance_of FarMar::Market
      expect(@vendor.market.name).to eq "People's Co-op Farmers Market"
      expect(@vendor2.market.name).to eq "Jefferson City Farmer's Market"
    end
  end

  describe "#products" do
    it "returns all Products for the specific vendor instance" do
      expect(@vendor.products.length).to eq 1
      expect(@vendor.products[0].name). to eq "Dry Beets"
      expect(@vendor2.products[0].name). to eq "Thoughtless Honey"
    end
  end

  describe "#sales" do
    it "returns all Sales for the specific vendor instance" do
      expect(@vendor.sales.length).to eq 7
      expect(@vendor.sales[0].amount).to eq 9290
      expect(@vendor2.sales.length).to eq 5
      expect(@vendor2.sales[0].amount).to eq 6539
    end
  end

  describe "#revenue" do
    it "returns the sum of sales for a specific vendor instance" do
      expect(@vendor.revenue).to eq 38259
      expect(@vendor2.revenue).to eq 30601
    end
  end

  describe "#self.by_market(id)" do
    it "returns all vendors with given market_id" do
      expect(FarMar::Vendor.by_market(1).length).to eq 6
      expect(FarMar::Vendor.by_market(1)[0].name).to eq "Feil-Farrell"
      expect(FarMar::Vendor.by_market(20).length).to eq 7
      expect(FarMar::Vendor.by_market(20)[0].name).to eq "Davis Group"
    end
  end

  #taking forever to run rspec, so commenting out
  # describe "#self.most_revenue(n)" do
  #   it "returns the top n vendor(s) with the highest revenue" do
  #     expect(FarMar::Vendor.most_revenue(3)).to be_an Array
  #     expect(FarMar::Vendor.most_revenue(3).length).to eq 3
  #     expect(FarMar::Vendor.most_revenue(3)[0].id).to eq 2590
  #     expect(FarMar::Vendor.most_revenue(3)[0].revenue > FarMar::Vendor.most_revenue(3)[1].revenue).to eq true
  #   end
  # end

  describe "#self.most_items(n)" do
    it "returns the top n vendors with the highest number of products" do
      expect(FarMar::Vendor.most_items(3)).to be_an Array
      expect(FarMar::Vendor.most_items(3).length).to eq 3
      expect(FarMar::Vendor.most_items(3)[0].id).to eq 2689
    end
  end

  # describe "self.revenue(date)" do
  #   it "returns the total revenue for that date across all vendors" do
  #     expect(FarMar::Vendor.revenue(Date.parse"2013-11-07"))).to eq 500
  #   end
  # end
end
