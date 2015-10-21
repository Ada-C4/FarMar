require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sale = FarMar::Sale.new({
      id: "1",
      amount: "9290",
      purchase_time: "2013-11-07 04:34:56 -0800",
      vendor_id: "1",
      product_id:"1"
      })
  end

  describe ".new" do
    it "creates a new instance of Sale" do
      expect(@sale).to be_an_instance_of FarMar::Sale
    end
  end

end
