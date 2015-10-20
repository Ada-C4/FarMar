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
      market_array =[]
      market_csv = CSV.read("./support/markets.csv")
      market_csv.each do |row|
        new_market = Market.new(row[0].to_i, row[1], row[2], row[3], row[4], row[5], row[6])
        market_array.push(new_market)
        # binding.pry
      end
      return market_array
    end

    def self.find(id)
      market_array = self.all
      market_array.find do |market|
        market.id == id
      end
      # markets.find do |market|
      #   market.id = id
      # end
    end




  end
end
