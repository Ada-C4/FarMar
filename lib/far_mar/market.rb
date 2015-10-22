require 'pry'
module FarMar

  class Market
    attr_accessor :name, :id, :address, :county, :state, :zip, :city

    def initialize (id, name, address, city, county, state, zip)
      @name = name
      @id = id
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end



    def self.all
      @@market_all ||= []
      if @@market_all == []
        market_csv = CSV.read("./support/markets.csv")
        market_csv.each do |row|
          new_market = Market.new(row[0].to_i, row[1], row[2], row[3], row[4], row[5], row[6])
          @@market_all.push(new_market)
          # binding.pry
        end
      end
      return @@market_all
    end

    def self.find(id)
      @@market_all= self.all
      @@market_all.find do |market|
        market.id == id
      end
    end

    def vendors
      return FarMar::Vendor.market(self.id)
    end

    def products
      # return FarMar::Product.by_market(self.id)
      return FarMar::Vendor.market(self.id, true)
    end

    def prefered_vendor
      return FarMar::Vendor.best_revenue(self.id)
     end

     def worst_vendor
       return FarMar::Vendor.worst_revenue(self.id)
     end

  end
end
