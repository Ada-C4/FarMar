require "spec_helper"
describe FarMar do
  describe FarMar::Sale do

    before :each do
      @sale = FarMar::Sale.new
    end

    describe ".new" do
      it "creates a new instance of the Sale class" do
        expect(@sale).to be_an_instance_of(FarMar::Sale)
      end
    end

  end
end
