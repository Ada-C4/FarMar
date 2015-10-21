module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id
    def initialize(product_hash)
      @id = product_hash[:id].to_i
      @name = product_hash[:name]
      @vendor_id = product_hash[:vendor_id].to_i
    end

    def self.all
      products = []
      product_array = CSV.read("support/products.csv")
      product_array.each do |line|
      new_product = Product.new(
        id: line[0],
        name: line[1],
        vendor_id: line[2])
        products.push(new_product)
      end
      return products
    end

    def self.find(id)
      product_array = CSV.read("support/products.csv")
      matched_line = product_array.find do |line|
        line[0].to_i == id
      end
      specific_product = Product.new(
        id: matched_line[0],
        name: matched_line[1],
        vendor_id: matched_line[2])
    end

    def vendor
      matched_vendor = FarMar::Vendor.all.find_all do |each|
        @vendor_id == each.id
      end
      return matched_vendor
    end

    def sales
      all_sales = FarMar::Sale.all.find_all do |each|
        @id == each.product_id
      end
      return all_sales
    end

    def number_of_sales
      self.sales.length
    end

    def self.by_vendor(vendor_id)
      product_party = FarMar::Product.all.find_all do |each|
        vendor_id.to_i == each.vendor_id
      end
      return product_party
    end
  end
end
