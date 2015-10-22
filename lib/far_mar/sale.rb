module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(sale_hash)
      @id = sale_hash[:id].to_i
      @amount = sale_hash[:amount].to_i
      @purchase_time = DateTime.parse(sale_hash[:purchase_time])
      @vendor_id = sale_hash[:vendor_id].to_i
      @product_id = sale_hash[:product_id].to_i
    end

    def self.all
      @@all_sales ||= CSV.read('./support/sales.csv').map do |col|
         FarMar::Sale.new({
          id: col[0],
          amount: col[1],
          purchase_time: col[2],
          vendor_id: col[3],
          product_id: col[4]
        })
      end
    end

    def self.find(id)
      all.find{|sale| sale.id == id}
    end

    def vendor
      FarMar::Vendor.all.find do |vendor|
        vendor.id == @vendor_id
      end
    end

    def product
      FarMar::Product.all.find do |product|
        product.id == @product_id
      end
    end

    def self.between(beginning_time, end_time)
      all.find_all do |sale|
        (sale.purchase_time > beginning_time) && (sale.purchase_time < end_time)
      end
    end

  end
end
