require "spec_helper"

describe Farmer::Sale do
  before :each do
    @sale = Farmer::Sale.new
  end

  context "initializing" do
    it "returns a sale object" do
      expect(@sale).to be_an_instance_of Farmer::Sale
    end
  end
end
