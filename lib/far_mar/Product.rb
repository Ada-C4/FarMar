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
      CSV.read("./support/products.csv").map do |row|
        FarMar::Product.new(row[0], row[1], row[2])
      end
    end
    def self.find(id)
      FarMar::Product.all.find do |product|
        product.id == id
      end
    end
  end
end
