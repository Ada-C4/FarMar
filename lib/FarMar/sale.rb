require 'csv'
require 'pry'

module FarMar
  class Sale

    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      @sales = []
      CSV.foreach('./support/sales.csv') do |row|
        newsales = Sale.new row[0].to_i, row[1].to_i, DateTime.parse(row [2]), row[3].to_i, row[4].to_i
        @sales.push(newsales)
      end
      return @sales
    end

    def self.find(id)
      return Sale.all.find do |sale|
          sale.id == id
      end
    end

# vendor: returns the FarMar::Vendor instance that is associated
# with this sale using the FarMar::Sale vendor_id field
    def vendor
      vendor_sales = []
      FarMar::Vendor.all.find_all do |sale|
        if sale.id == vendor_id
          vendor_sales.push(sale)
        end
      end
    end
  end
end

# def self.by_market(market_id)
#   all_vendors = []
#   Vendor.all.find_all do |vendor|
#     if vendor.market_id == market_id
#     all_vendors.push(vendor)
#     end
#   end
# return all_vendors
