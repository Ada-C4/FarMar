module FarMar
  class Sale
    #sale_csv = CSV.read("support/sales.csv")
    attr_accessor :sale_id
    def initialize(sale_hash)
      @sale_id       = sale_hash[:id].to_i
      @amount        = sale_hash[:amount].to_i
      @purchase_time = sale_hash[:purchase_time] ### NEEDS TO BE DATETIME
      @vendor_id     = sale_hash[:vendor_id].to_i
      @product_id    = sale_hash[:product_id].to_i
    end

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

    def self.find(id)
      @sales.find do |sale|
        sale.sale_id == id
      end
    end
  end
end
