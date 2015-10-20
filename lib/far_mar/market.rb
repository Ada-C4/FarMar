
module FarMar
  class Market

    attr_reader :id, :name

    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      all_markets = []

      CSV.read("./support/markets.csv").each do |line|
        y = FarMar::Market.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
        all_markets.push(y)
      end

      return all_markets
    end

    def self.find(id)
      FarMar::Market.all.find do |market_instance|
        market_instance.id == id
      end
    end

  end
end
