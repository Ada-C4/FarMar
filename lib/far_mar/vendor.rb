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

# found all the vendors in the market - with default of salfe.
# if the test = true => it return all the products in that market.
    def self.market(id, extra_test = false)
      @@array_all = self.all
      if extra_test == false
        @@array_all.find_all do |vendor|
          vendor.market_id == id
        end
      else
        final_array = []
        products_array = FarMar::Product.all
        @@array_all.each do |vendor|
          products_array.each do |product|
            final_array.push(product) if (product.vendor_id == vendor.id) && (vendor.id == id)
          end
        end
        return final_array
      end
    end

    def products
      return products_array = FarMar::Product.by_vendor(self.id)
    end

    def sales
      return Farmar::Sale.by_vendor(self.id)
    end


    def revenue
      sale_array = FarMar::Sale.by_vendor(self.id)
      return sale_array.inject(0){|sum, sale| sum + sale.amount}
    end

    def self.best_revenue(market_id)
      vendors = self.by_market(market_id)
      max = 0
      winner = nil
      vendors.each do |vendor|
        revenue = vendor.revenue.to_i
        if revenue > max
        max = revenue
        winner = vendor
        end
      end
      return winner
    end

    def self.worst_revenue(market_id)
      vendors = self.by_market(market_id)
      min = 10000000000
      looser = nil
      vendors.each do |vendor|
        revenue = vendor.revenue.to_i
        if revenue < min
        min = revenue
        looser = vendor
        end
      end
      return looser
    end

    def self.by_market(market_id)
      @@array_all = self.all
      @@array_all.find_all do |vendor|
        vendor.market_id == market_id
      end
    end


  end
end
