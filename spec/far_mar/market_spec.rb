require "spec_helper"

describe FarMar do
  describe FarMar::Market do
    describe "initialize" do
      it "creates an instance of a Market" do
        expect(FarMar::Market.new).to be_an_instance_of FarMar::Market
      end
    end
  end
end
