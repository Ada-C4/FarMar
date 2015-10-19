require "spec_helper"

describe FarMar do
  describe FarMar::Sale do
    describe "initialize" do
      it "creates an instance of a Sale" do
        expect(FarMar::Sale.new).to be_an_instance_of FarMar::Sale
      end
    end
  end
end
