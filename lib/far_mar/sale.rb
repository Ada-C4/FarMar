module FarMar
  class Sale
    #sale_csv = CSV.read("support/sales.csv")
    attr_accessor :sale_id, :vendor_id, :product_id
    def initialize(sale_hash)
      @sale_id       = sale_hash[:id].to_i
      @amount        = sale_hash[:amount].to_i
      @purchase_time = sale_hash[:purchase_time] ### NEEDS TO BE DATETIME
      @vendor_id     = sale_hash[:vendor_id].to_i
      @product_id    = sale_hash[:product_id].to_i
    end

    # Returns a collection of Sale instances, representing all of the sales described in the CSV
    def self.all
      @sales = []
      sales_csv = CSV.read("support/sales.csv")

      sales_csv.each do |id, amount, purchase_time, vendor_id, product_id|
        hash = {:id => id, :amount => amount, :purchase_time => purchase_time,  :vendor_id => vendor_id, :product_id => product_id}
        sale = FarMar::Sale.new(hash)
        @sales.push(sale)
      end
      return @sales
    end

    # Returns an instance of Sale where the value of the ID field matches the passed parameter
    def self.find(id)
      @sales.find do |sale|
        sale.sale_id == id
      end
    end

    # Returns the FarMar::Vendor instance associated with this sale
    def vendor
      FarMar::Vendor.find(self.vendor_id)
    end

    # Returns the FarMar::Product instance associated with this sale
    def product
      FarMar::Product.find(self.product_id)
    end

    # Returns a collection of FarMar::Sale objects where the purchase time is between the two given times
    def self.between(beginning_time, end_time)
    end

  end
end
