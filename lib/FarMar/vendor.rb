require 'csv'
require 'pry'

module FarMar
  class Vendor

    attr_reader :id, :name, :num_employees, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end

    def self.all
      @@vendors ||= []

      if @@vendors == []
        CSV.foreach('./support/vendors.csv') do |row|
          newvendors = Vendor.new row[0].to_i, row[1].to_s, row[2].to_i, row[3].to_i
          @@vendors.push(newvendors)
        end
      end
      return @@vendors
    end

    def self.find(id)
      return Vendor.all.find do |sale|
          sale.id == id
      end
    end
# market - returns the FarMar::Market instance that is associated with this vendor
# using the FarMar::Vendor market_id field

    def market
      return FarMar::Market.all.find do |market|
        market.id == id
      end
    end

    #below is the same, just broken out into more steps

    # def market
    #     FarMar::Market.all.find_all do |market|
    #       if market.id == id
    #   return market
    # end

# products - returns a collection of FarMar::Product instances
# that are associated by the FarMar::Product vendor_id field.

    def products
    all_products = []
      FarMar::Product.all.find_all do |product|
        if product.vendor_id == id
          all_products.push(product)
        end
      end
    return all_products
    end

#sales - returns a collection of FarMar::Sale instances
#that are associated by the vendor_id field.

    def sales
      all_sales = []
      FarMar::Sale.all.find_all do |sale|
        if sale.vendor_id == id
          all_sales.push(sale)
        end
      end
      return all_sales
    end

# revenue - returns the the sum of all of the vendor's sales
    def revenue
      total = 0
      FarMar::Sale.all.each do |sale|
        if sale.vendor_id == id
          total += sale.amount
        end
      end
      return total
    end

# returns all of the vendors with the given market_id

    def self.by_market(mrkt_id)
      all_vendors = []
      Vendor.all.find_all do |vendor|
        if vendor.market_id == mrkt_id
        all_vendors.push(vendor)
        end
      end
    return all_vendors
    end


  end
end
