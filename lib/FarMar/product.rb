require 'csv'
require 'pry'

module FarMar
  class Product

attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

    def self.all
      @products = []
      CSV.foreach('./support/products.csv') do |row|
        newproducts = Product.new row[0].to_i, row[1].to_s, row[2].to_i
        @products.push(newproducts)
      end
      return @products
    end

    def self.find(id)
      return Product.all.find do |product|
          product.id == id
      end
    end

# number_of_sales - returns the number of times this
# product has been sold.

    def number_of_sales
      total_products_sold = FarMar::Sale.all.find_all do |sale|
        sale.product_id == id
      end
      return total_products_sold.length
    end

# returns all of the vendors with the given vendor_id
    def self.by_vendor(vendor_id)
    all_vendors = []
      FarMar::Vendor.all.find_all do |vendor|
        if vendor.id == vendor_id
          all_vendors.push(vendor)
        end
      end
    return all_vendors
    end

  end
end
