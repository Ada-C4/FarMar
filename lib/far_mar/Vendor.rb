require './lib/far_mar'
module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id
    def initialize(id, name, num_employees, market_id)
      @id = id.to_i
      @name = name
      @num_employees = num_employees.to_i
      @market_id = market_id.to_i
    end
    def self.all
      CSV.read("./support/vendors.csv").map do |row|
        FarMar::Vendor.new(row[0], row[1], row[2], row[3])
      end
    end
    def self.find(id)
      FarMar::Vendor.all.find do |vendor|
        vendor.id == id
      end
    end
    def market
      FarMar::Market.all.find do |market|
        market.id == self.market_id
      end
    end
    def products
      FarMar::Product.all.find_all do |product|
        product.vendor_id == self.id
      end
    end
    def sales
      FarMar::Sale.all.find_all do |sale|
        sale.vendor_id == self.id
      end
    end
    def revenue
      amounts = self.sales.map do |sale|
        sale.amount
      end
      amounts.inject { |result, sale| result + sale }
    end
    def self.by_market(market_id)
      self.all.find_all do |vendor|
        market_id == vendor.market_id
      end
    end
  end
end
