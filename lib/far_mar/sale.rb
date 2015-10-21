module FarMar
  class Sale
    attr_reader :id, :vendor_id, :product_id, :amount

    def initialize(sale_info)
      @id = sale_info[0].to_i
      @amount = sale_info[1].to_i
      @purchase_time = DateTime.strptime(sale_info[2], "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = sale_info[3].to_i
      @product_id = sale_info[4].to_i
    end

    def self.all
      sale_array = []
      CSV.read("./support/sales.csv").each do |sale|
        new_sale = FarMar::Sale.new(sale)
        sale_array.push(new_sale)
      end
      return sale_array
    end

    def self.find(id)
      FarMar::Sale.all.find do |sale|
        sale.id == id
      end
    end

    def vendor
      FarMar::Vendor.all.find do |vendor|
        vendor.id == self.vendor_id
      end
    end

  end
end
