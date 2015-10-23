require "csv"

module FarMar
  class Vendor

    attr_accessor :id, :name, :employees, :market_id, :vendors

    def initialize(id, name, employees, market_id)
      @id = id.to_i
      @name = name
      @employees = employees.to_i
      @market_id = market_id.to_i
    end

    # Returns an array of Vendor instances
    # representing all of the vendors in the CSV
    def self.all
      csv_info = CSV.read("./support/vendors.csv")
      vendors = []
      csv_info.each do |line|
        vendors.push(Vendor.new(line[0], line[1], line[2], line[3]))
      end
      return vendors
    end

    # Returns an instance of Vendor where the value of the id
    # matches the passed parameter.
    def self.find(vendor_id)
      all.each do |vendor|
        if vendor.id == vendor_id
          return vendor # the instance of the vendor.
        end
      end
    end

    # Checking the market_id (of the vendor), what market do I belong to?
    def market
      FarMar::Market.all.each do |market|
        if market.id == market_id
          return market
        end
      end
    end

    # Returns an array of products with a vendor_id that matches the Vendor id
    def products
      product_array = []
      FarMar::Product.all.find_all do |product|
        if product.vendor_id == id
          product_array.push(product)
        end
      end
      return product_array
    end

    # Returns array of sales with vendor_id that match the vendor's ID
    def sales
      sales_array = []
      FarMar::Sale.all.find_all do |sale|
        if sale.vendor_id == id
          sales_array.push(sale)
        end
      end
      return sales_array
    end

    # Add all sales for vendor. Return sum in cents.
    # If the vendor_id in Sale matches the Vendor ID, add them. Start a count.
    def revenue
      sale_cents = 0
      FarMar::Sale.all.each do |sale|
        if sale.vendor_id == id
          sale_cents += sale.amount
        end
      end
      return sale_cents
    end

    # Returns all of the vendors with the given market_id.
    # (check the Vendors and if market_id matches market_id, array them.)
    def self.by_market(market_id)
      vendor_by_market_array = []
      all.each do |vendors|
        if vendors.market_id == market_id
          vendor_by_market_array.push(vendors)
        end
      end
      return vendor_by_market_array
    end
    
  end
end
