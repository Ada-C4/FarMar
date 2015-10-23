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

     def self.search(search_term)
       include_array =[]
       vendor_array = FarMar::Vendor.all
       vendor_array.each do |vendor|
         vendor_name = vendor.name
         if vendor_name.include?(search_term)
           market = self.find(vendor.market_id)
           if !(check_include(include_array, market))
              # !include_array.iclude?(market)
             include_array.push(market)
           end
         end
       end
        @@market_all = self.all
        @@market_all.each do |market|
          market_name = market.name
          if market_name.include?(search_term) #working
            # binding.pry
            if (check_include(include_array, market) == false)
              include_array.push(market)
            end
          end
        end
        return include_array
     end

     def self.check_include (include_array , market)
       include_array.each do |mar|
         if mar.name == market.name
           return true
         end
       end
       return false
     end

  end
end
