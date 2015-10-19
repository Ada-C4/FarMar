require 'spec_helper'

describe FarMar do
  describe FarMar::Product do
    describe "#initialize" do
      it "creates a new Product instance" do
        expect(FarMar::Product.new()).to be_an_instance_of(FarMar::Product)
      end
    end
  end
end
