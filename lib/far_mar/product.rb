module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      if @all_products.nil? || @all_products.empty?
        @all_products =CSV.read("support/products.csv").map do |line|
          FarMar::Product.new(line[0].to_i, line[1], line[2].to_i)
        end
      end
      return @all_products
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

    def number_of_sales
      return sales.length
    end

    def self.by_vendor(vendor_id)
      vendor = FarMar::Vendor.find(vendor_id)
      return vendor.products
    end

    def revenue
      total_revenue = 0
      sales.each do |sale|
        if sale.product_id == @id
          total_revenue += sale.amount
        end
      end
      return total_revenue
    end

    def self.most_revenue(n)
      return FarMar::Product.all.max_by(n) {|product| product.revenue}
    end
  end
end
