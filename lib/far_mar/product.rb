module FarMar
  class Product
    #product_csv = CSV.read("support/products.csv")
    attr_accessor :product_id, :product_name, :vendor_id
    def initialize(product_hash)
      @product_id   = product_hash[:id]
      @product_name = product_hash[:name]
      @vendor_id    = product_hash[:vendor_id]
    end

    def self.all
      @products = []
      products_csv = CSV.read("support/products.csv")

      products_csv.each do |id, name, vendor_id|
        hash = {:id => id, :name => name, :vendor_id => vendor_id}
        product = FarMar::Product.new(hash)
        @products.push(product)
      end
      return @products
    end

    def self.find(id)
      @products.find do |product|
        product.product_id == id
      end
    end



  end
end
