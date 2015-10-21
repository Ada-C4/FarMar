require "pry"
require "csv"

module FarMar
  class Vendor
    attr_accessor :id, :name, :no_of_employees, :market_id

    def initialize (id, name, no_of_employees, market_id)
      @id = id.to_i
      @name = name
      @no_of_employees = no_of_employees.to_i
      @market_id = market_id.to_i
    end

    def self.all
      vendor_array = []
      vendor_data = CSV.read("./support/vendors.csv")
      vendor_data.each do |csv|
      @v = Vendor.new(csv[0], csv[1], csv[2], csv[3])
      vendor_array.push(@v)
      end
    return vendor_array
    end

    def self.find(id)
      vendor_data = Vendor.all
      vendor_data.find do |data|
        if data.id == id
          return data
        end
      end
    end
    def get_market
      FarMar::Market.all.find do |market|
        market.id == @id
      end
    end

    def get_products
      FarMar::Product.all.find_all do |product|
        product.vendor_id == @id
      end

    end


  end
end
