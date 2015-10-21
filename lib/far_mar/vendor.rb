require 'pry'
module FarMar
  class Vendor
     attr_accessor :name, :id, :no_employess, :market_id

    def initialize (id, name, no_employess, market_id)
      @name = name
      @id = id
      @no_employess = no_employess
      @market_id = market_id
    end

    def self.all
      @@array_all ||= []
      if @@array_all == []
        vendor_csv = CSV.read("./support/vendors.csv")
        vendor_csv.each do |sale|
          new_vendor = Vendor.new(sale[0].to_i, sale[1], sale[2], sale[3].to_i)
          @@array_all.push(new_vendor)
        end
      end
      return @@array_all
    end

    def self.find(id)
      @@array_all = self.all
      @@array_all.find do |vendor|
        vendor.id == id
      end
    end

    def self.market(id)
      @@array_all = self.all
      @@array_all.find_all do |vendor|
        vendor.market_id == id
      end
    end

    def products
      return products_array = FarMar::Product.vendor(self.id)
    end

    def sales
      return Farmar::Sale.by_vendor(self.id)
    end


    def revenue
      sale_array = FarMar::Sale.by_vendor(self.id)
      return sale_array.inject(0){|sum, sale| sum + sale.amount}
    end

    def self.by_market(market_id)
      @@array_all = self.all
      @@array_all.find_all do |vendor|
        vendor.market_id == market_id
      end
    end

    #  return sale_array.inject(0) {|sum, sale.amount| sum + sale.amount}
    #end

  end
end
