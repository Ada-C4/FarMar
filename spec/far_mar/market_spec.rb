require "spec_helper"

describe FarMar::Market do
  describe "#initialize" do
    it "it creates a new Market instance" do
      expect(FarMar::Market.new()).to be_an_instance_of(FarMar::Market)
    end
  end

end
