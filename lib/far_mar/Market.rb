require './lib/far_mar'
module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    def initialize(id, name, address, city, county, state, zip)
      #fixnum; unique
      @id = id.to_i
      #string
      @name = name
      #string
      @address = address
      #string
      @city = city
      #string
      @county = county
      #string
      @state = state
      #string
      @zip = zip
    end
    def self.all
      CSV.read("./support/markets.csv").map do |row|
        FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
      end
    end
  end
end
