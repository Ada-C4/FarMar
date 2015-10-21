module FarMar
  class Sale

    def initialize(sale_hash)
      @id = sale_hash[:id].to_i
      @amount = sale_hash[:amount].to_i
      @purchase_time = DateTime.parse(sale_hash[:purchase_time])
      @vendor_id = sale_hash[:vendor_id].to_i
      @product_id = sale_hash[:product_id].to_i
    end

    def self.all
    end

    def self.find(id)
    end

    # def vendor
    # end
    #
    # def product
    # end
    #
    # def self.between(beginning_time, end_time)
    # end
  end
end
