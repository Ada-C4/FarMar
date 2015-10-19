require "spec_helper"

describe FarMar do
  describe FarMar::Sale do
    before :each do
      @sale = FarMar::Sale.new
    end

    describe "#initialize" do
      it "creates a new instance of Sale" do
        expect(@sale).to be_an_instance_of FarMar::Sale
      end
    end
  end
end
