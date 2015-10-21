require "spec_helper"

describe FarMar::Sale do
  before :each do
    @sales = FarMar::Sale.all
  end

  describe "#new" do
    it "create a new instance of Sale" do
      example_sale_hash = {:id => 1111, :amount => 5678, :purchase_time => "a date", :vendor_id => 1, :product_id => 3} # NEED TO BUILD THE HASH
      example_sale = FarMar::Sale.new(example_sale_hash)
      expect(example_sale).to be_an_instance_of FarMar::Sale
    end
  end


describe ".all" do
  it "creates a sale object for every sale listed in the datafile" do
    csv = CSV.read("support/sales.csv")
    expect(@sales.length).to eq csv.length
  end
end

describe ".find" do
  it "can find a sale object with a given ID" do
    test_id = @sales[2].sale_id
    expect(FarMar::Sale.find(test_id)).to eq @sales[2]
  end
end

describe "#vendor" do
  it "returns a vendor object for the current sale" do
    sale = @sales[1]
    expect(sale.vendor).to be_an_instance_of FarMar::Vendor
  end

  it "returns the correct vendor object for a sale" do
    sale = @sales[1]
    expect(sale.vendor.vendor_name).to eq "Feil-Farrell"
  end
end

describe "#product" do
  it "returns a product object for the current sale" do
    sale = @sales[1]
    expect(sale.product).to be_an_instance_of FarMar::Product
  end

  it "returns the correct product object for a sale" do
    sale = @sales[1]
    expect(sale.product.product_name).to eq "Dry Beets"
  end
end

end
