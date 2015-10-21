module FarMar
  class Product

    attr_reader :product_id, :name, :vendor_id

    def initialize(product_id, name, vendor_id)
      @product_id = product_id
      @name = name
      @vendor_id = vendor_id
    end


    def self.all
      products_csv = CSV.read("./support/products.csv")
      product_instances = []
      products_csv.each do |row|
        product_instances.push(Product.new(row[0].to_i, row[1], row[2].to_i))
      end
      return product_instances
    end
    def self.find(id)
        self.all.find do |product|
        product.product_id == id
      end
    end

    def vendor
      product_vendor_array = FarMar::Vendor.all
      product_vendor_array.each do |row|
        if row.vendor_id == @vendor_id
          return row
        end
      end
    end

  end
end
