module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_hash)
      @id = market_hash[:id].to_i
      @name = market_hash[:name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]
    end

    def self.all
      # if @@all_markets is nil, reads the csv and creates the array
      # otherwise uses array already in memory
      @@all_markets ||= CSV.read('./support/markets.csv').map do |col|
         FarMar::Market.new({
          id: col[0],
          name: col[1],
          address: col[2],
          city: col[3],
          county: col[4],
          state: col[5],
          zip: col[6]
        })
      end
    end

    def self.find(id)
      # can use all without self (all.find instead of self.all.find) because already in the class scope
      all.find do |market|
        market.id == id
      end
    end

    def vendors
    #  returns a collection of FarMar::Vendor instances
    #  that are associated with the market by the market_id field.
      FarMar::Vendor.all.find_all do |vendor|
        vendor.market_id == @id
      end
    end

    def products
      # if just .map, this would give back an array of an array of instances
      # .flat_map is like calling .flatten on the .map array
      vendors.flat_map{|vendor| vendor.products }
    end

    def self.search(search_term)
      all.find_all do |market|
        market.name.downcase.include?(search_term.downcase) ||
        market.vendors.any?{|vendor| vendor.name.downcase.include?(search_term.downcase)}
      end
    end

    def preferred_vendor
      # highest_rev = 0
      # pref_vendor = nil
      # vendors.each do |vendor|
      #   if vendor.revenue > highest_rev
      #     highest_rev = vendor.revenue
      #     pref_vendor = vendor
      #   end
      # end
      # return pref_vendor
      vendors.max_by{|vendor|vendor.revenue}
    end

    # def preferred_vendor_date(date)
    #   date = date.to_date
    #   vendors.max_by{|vendor|vendor.revenue}
    #
    # end

    def worst_vendor
      vendors.min_by{|vendor|vendor.revenue}
    end


  end
end
