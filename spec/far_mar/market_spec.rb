require "spec_helper"

describe FarMar::Market do
  describe "initialize" do
    it "creates an instance of a market" do
      expect(FarMar::Market.new({})).to be_an_instance_of FarMar::Market
    end
  end

  describe "self.all" do
    it "returns an array or all the markets" do
      expect(FarMar::Market.all.length).to eq 500
    end

    it "reads values correctly" do
      expect(FarMar::Market.all()[24].state).to eq "Illinois"
    end
  end

  describe "self.find" do
    it "returns a market given an id" do
      expect(FarMar::Market.find(4).name).to eq "Preston Farmers’ Market"
    end
  end
end

#   describe "#vendors" do
#     before :each do
#       bob = Market.new(1,People's Co-op Farmers Market,30th and Burnside,Portland,Multnomah,Oregon,97202)
#     end
#     it "returns list of matched vendors to id" do
#       expect(bob.vendors).to include
#     end
#   end
# end
