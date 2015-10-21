module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      CSV.read("support/products.csv").map do |line|
        FarMar::Product.new(line[0].to_i, line[1], line[2].to_i)
      end
    end

    def self.find(id)
      match = CSV.open("support/products.csv").find { |n| n[0].to_i == id}
      return FarMar::Product.new(match[0].to_i, match[1], match[2].to_i)
    end

    def vendor
      return FarMar::Vendor.all.find {|vendor| vendor.id == @vendor_id}
    end

    def sales
      return FarMar::Sale.all.find_all {|sale| sale.product_id == @id}
    end
  end
end
