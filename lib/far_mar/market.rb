require "pry"
module FarMar

  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip
    def initialize(market_hash)
      @id = market_hash[:id]
      @name = market_hash[:name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]
    end

    def self.all
      markets_all = []
      markets_data = CSV.read("support/markets.csv")

      markets_data.each do |id, name, address, city, county, state, zip|
        #binding.pry
        market_hash = {:id => id, :name => name, :address => address, :city => city, :county => county, :state => state, :zip => zip}
        market = FarMar::Market.new(market_hash)
        markets_all.push(market)
      end
      return markets_all
    end

    #def self.all
    #  markets_csv = CSV.read("./support/markets")
    #  markets_csv.foreach do |id, name, address, city, county, state, zip|
    #    Market.new(:id => id, :name => name, :address => address, :city => city, :county => county, :state => state, :zip => zip)
    #  end
    #end
  end
end
    #CSV.foreach(file_path, :headers => true, :col_sep => ';') do |row|
  #Car.create(:make => row[0], :model => row[1], :year => row[2])
#end
