CSV.read("./support/products.csv")

module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      all_products = []

      CSV.read("./support/products.csv").each do |line|
        y = FarMar::Product.new(line[0].to_i, line[1], line[2].to_i)
        all_products.push(y)
      end

      return all_products
    end

    def self.find(id)
      FarMar::Product.all.find do |product_instance|
        product_instance.id == id
      end
    end

    def self.by_vendor(vendor_id)
      FarMar::Product.all.find_all do |product_instance|
        product_instance.vendor_id == vendor_id
      end
    end

    def vendor
      FarMar::Vendor.all.find do |vendor_instance|
        vendor_instance.id == @vendor_id
      end
    end

    def sales
      FarMar::Sale.all.find_all do |sales_instance|
        sales_instance.product_id == @id
      end
    end

    def number_of_sales
      self.sales.length
    end
  end
end
