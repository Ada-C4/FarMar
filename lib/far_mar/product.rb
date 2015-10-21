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
      FarMar::Vendor.all.find do |vendor|
        vendor.id == @vendor_id
      end
    end

    def sales
      FarMar::Sale.all.find_all do |sale|
        sale.product_id == @id
      end
    end

    def number_of_sales
      sales.length
    end

    # def self.by_vendor(vendor_id)
    # end
  end
end
