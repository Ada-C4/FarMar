require "./spec/spec_helper.rb"

describe FarMar::Markets do
  describe "initialize"
    market = Markets.new
    it "creates a new instace of the market class" do
      expect(market).to be_an_instance_of Markets
    end
end
