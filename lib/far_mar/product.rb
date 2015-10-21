module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(product_hash)
      @id = product_hash[:id].to_i
      @name = product_hash[:name]
      @vendor_id = product_hash[:vendor_id].to_i
    end

    def self.all
      @@all_products ||= CSV.read('./support/products.csv').map do |col|
         FarMar::Product.new({
           id: col[0],
           name: col[1],
           vendor_id: col[2]
         })
       end
    end

    def self.find(id)
      all.find{|product| product.id == id}
    end

    def vendor
    end

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
