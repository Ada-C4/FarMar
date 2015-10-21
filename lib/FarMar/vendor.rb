require 'csv'
require 'pry'

module FarMar
  class Vendor


    def initialize(id, name, num_employees, market_id)
      @id = id
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end

    def self.all
      @vendors = []
      CSV.foreach('./support/sales.csv') do |row|
        newvendors = Vendor.new row[0].to_i, row[1].to_s, row[2].to_i, row[3].to_i
        @vendors.push(newvendors)
      end
      return @vendors
    end

    def self.find(id)
      return Vendor.all.find do |sale|
          sale.id == id
      end
    end
  end
end
