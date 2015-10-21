require './lib/far_mar'
module FarMar
  class Product
    attr_reader :id, :name, :vendor_id
    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end
    def self.all
      @@products_all ||= []
      if @@products_all == []
        CSV.read("./support/products.csv").map do |row|
          @@products_all.push(FarMar::Product.new(row[0], row[1], row[2]))
        end
      end
      return @@products_all
    end
    def self.find(id)
      FarMar::Product.all.find do |product|
        product.id == id
      end
    end
    def vendor
      FarMar::Vendor.all.find do |vendor|
        vendor.id == self.vendor_id
      end
    end
  end
end
