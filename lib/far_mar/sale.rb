module FarMar
  class Sale
    attr_reader :id, :vendor_id, :product_id

    def initialize(sale_info)
      @id = sale_info[0].to_i
      @amount = sale_info[1].to_i
      @purchase_time = sale_info[2]
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
  end
end
