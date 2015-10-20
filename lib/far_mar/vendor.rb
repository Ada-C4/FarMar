require "csv"

module FarMar
  class Vendor

    attr_accessor :id, :name, :employees, :market_id, :vendors
    # add initialize to all classes!!
    def initialize (values)
      @id = values[0].to_i
      @name = values[1]
      @employees = values[2].to_i
      @market_id = values[3].to_i
    end

    def self.all
      # returns a collection of Vendor instances
      # representing all of the vendors described in the CSV
      @csv_info = CSV.read("./support/vendors.csv")
      vendors = []
      @csv_info.each do |line|
        vendors.push(Vendor.new(line[0], line[1], line[2], line[3]))
      end
      return vendors
    end

    def self.find(id)
      # Returns an instance of Vendor where the value of the id in the csv
      # matches the passed parameter.
    end

    def market(market_id)
      # Given the market ID, what market do I belong to?
    end

    def products(vendor_id)
      # Given the vendor_id, what products are associated with it? (collection)
    end

    def sales(vendor_id)
      # Given the vendor_id, return a collection of sales for that vendor.
    end

    def revenue(vendor_id)
      # Add all sales for vendor.
      # return sum in cents.
    end

    def self.by_market(market_id)
      # Returns all of the vendors with the given market_id.
    end
  end
end
