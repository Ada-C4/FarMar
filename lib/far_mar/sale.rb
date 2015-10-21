module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(sale_hash)
      @id = sale_hash[:id].to_i
      @amount = sale_hash[:amount].to_i
      @purchase_time = DateTime.parse(sale_hash[:purchase_time])
      @vendor_id = sale_hash[:vendor_id]
      @product_id = sale_hash[:product_id]
    end

    def self.all
      @@sales_all ||= []
      if @@sales_all == []
        CSV.read("support/sales.csv").each do |id, amount, purchase_time, vendor_id, product_id|
          sale_hash = {:id => id, :amount => amount, :purchase_time => purchase_time, :vendor_id => vendor_id, :product_id => product_id}
          market = FarMar::Sale.new(sale_hash)
          @@sales_all.push(market)
        end
      end
      return @@sales_all
    end

  end
end
