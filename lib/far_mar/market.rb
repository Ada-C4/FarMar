module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip

    def initialize(id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      markets_list = []
      markets_csv = CSV.read("./support/markets.csv")

      markets_csv.each do |row|
        market = FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        markets_list.push(market)
      end

      return markets_list
    end
  end
end
