module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

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
      CSV.read("support/markets.csv").map do |line|
        FarMar::Market.new(line[0].to_i, line[1], line[2], line[3], line[4], line[5], line[6])
      end
    end

    def self.find(id)
      match = CSV.open("support/markets.csv").find { |n| n[0].to_i == id}
      return FarMar::Market.new(match[0].to_i, match[1], match[2], match[3], match[4], match[5], match[6])
    end
  end
end
