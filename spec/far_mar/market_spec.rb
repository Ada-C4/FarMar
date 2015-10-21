require "spec_helper"

describe FarMar do
  describe FarMar::Market do
    before :each do
      #@market = FarMar::Market.all
    end

    describe "#initialize" do
      it "creates a new instance of Market" do
        fake_hash = {:id => 666, :name => "Boo Boo", :address => "123 Haunted House Way", :city => "Spooky Estates", :county => "Cook", :state => "IL", :zip => 60616}
        test = FarMar::Market.new(fake_hash)
        expect(test).to be_an_instance_of FarMar::Market
      end
    end

    describe '#self.all' do
      it "returns a collection of Market instances" do
        expect(FarMar::Market.all.length).to eq CSV.read("support/markets.csv").length
      end
    end

    describe "self.find(id)" do
      it "returns specific instance of market" do
        find_test = FarMar::Market.find(15)
        expect(find_test.name).to eq "Farmers Market in Denison"
      end
    end

    describe "list_vendors(id)" do
      it "returns array of vendors at specific market" do
        vendor_list_test = FarMar::Market.find(20)
        vendor_list_test.list_vendors.each do |vendor|
          expect(vendor.market_id).to eq 20
        end
      end
    end
  end
end
