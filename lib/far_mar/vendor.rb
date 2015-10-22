require "csv"

module FarMar
  class Vendor

    attr_accessor :id, :name, :employees, :market_id, :vendors
    # add initialize to all classes!!
    def initialize(id, name, employees, market_id)
      @id = id.to_i
      @name = name
      @employees = employees.to_i
      @market_id = market_id.to_i
    end

    def self.all
      # returns an array of Vendor instances
      # representing all of the vendors described in the CSV
      csv_info = CSV.read("./support/vendors.csv")
      @vendors = []
      csv_info.each do |line|
        @vendors.push(Vendor.new(line[0], line[1], line[2], line[3]))
      end
      return @vendors
    end

    def self.find(vendor_id)
      # Returns an instance of Vendor where the value of the id in the csv
      # matches the passed parameter.
      all.each do |vendor|
        if vendor.id == vendor_id
          return vendor # the instance of the vendor.
        end
      end
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
