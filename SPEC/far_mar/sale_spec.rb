require "spec_helper"

describe FarMar::Sales do
  before :each do
    sales_hash = {
      id: 311,
      amount: 1200,
      # purchase_time: 2016-11-09 09:34:56 -0800,
      vendor_id: 34,
      product_id: 9118
    }
    @sales = FarMar::Sales.new(sales_hash)
  end

  describe "self.new" do
    it "creates a new instance of Market" do
      expect(@sales).to be_an_instance_of FarMar::Sales
    end

    it "has an id property that is equal to what it is passed in" do
      expect(@sales.id).to eq 311
    end

    it "knows bout its associated data file" do
      expect(@sales.sales_csv).to eq ("./support/sales.csv")
    end
  end
end
