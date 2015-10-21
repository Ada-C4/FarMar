require "pry"
require "csv"

module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize (id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def self.all
      product_array =[]
      product_data = CSV.read("./support/products.csv")
      product_data.each do |csv|
      @p = Product.new(csv[0], csv[1],csv[2])
      product_array.push(@p)
    end
    return product_array
    end

    def self.find(id)
      product_data = Product.all
      product_data.find do |data|
          if data.id == id
            return data
          end
        end
    end
  end
end
