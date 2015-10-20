require "spec_helper"

describe FarMar do
  describe FarMar::Market do
    before :each do
      @market = FarMar::Market.all
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
        
        expect(@market.length).to eq 4
      end

    end
  end
end
