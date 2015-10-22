# CSV.read('./support/markets.csv')

module FarMar

  class Market
    attr_reader :market_id, :name, :address, :city, :county, :state, :zip

  	def initialize(market_id, name, address, city, county, state, zip)
  		@market_id = market_id.to_i
  		@name = name
  		@address = address
  		@city = city
  		@county = county
  		@state = state
  		@zip = zip
  	end

  	def self.all
      @@market_array ||= []
      if @@market_array == []
  		  CSV.read('./support/markets.csv').each do |row|
          market = FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
          @@market_array.push(market)
        end
      end
      return @@market_array
  	end

    def self.find(id)
      @@market_array.find {|mar| mar.market_id == id }
    end

    def vendors
      FarMar::Vendor.all.find_all {|ven| ven.market == market_id }
    end

    def products
      ven_array = self.vendors
      prod_array = []
      ven_array.each do |ven|
        prod_array.push(ven.products)
        end
      return prod_array.flatten
    end

    def self.search(search_term)
      search_term = search_term.downcase
      match_markets = []
      @@market_array.each do |market|
        match_markets.push(market) if market.name.downcase.match(/#{search_term}/)
      end
      match_vendors = []
      FarMar::Vendor.all.each do |vendor|
        match_vendors.push(vendor) if vendor.name.downcase.match(/#{search_term}/)
       end
       match_vendors.map! {|vendor| vendor.market}
       match_vendors.each do |market_id|
         market = FarMar::Market.find(market_id)
         match_markets.push(market)
       end
       return match_markets
    end

    def preferred_vendor
      ven = self.vendors
    end

  end

end