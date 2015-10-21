require 'csv'
require 'pry'

module FarMar
  class Product

attr_reader :id, :name, :vendor_id

    def initialize
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      @products = []
      CSV.foreach('./support/products.csv') do |row|
        newproducts = Product.new row[0].to_i, row[1].to_s, row[2].to_s
        @products.push(newproducts)
      end
      return @products
      end
    end

  end
end
