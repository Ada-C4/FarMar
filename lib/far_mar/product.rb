module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(product_hash)
      @id = product_hash[:id].to_i
      @name = product_hash[:name]
      @vendor_id = product_hash[:vendor_id].to_i
    end

    def self.all
    end

    def self.find(id)
    end

    # def vendor
    # end
    #
    # def sales
    # end
    #
    # def number_of_sales
    # end
    #
    # def self.by_vendor(vendor_id)
    # end
  end
end
