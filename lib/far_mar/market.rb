require "pry"
require "csv"
module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip
    attr_reader :object

    def initialize (id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
      @object = 

    end


    def self.all
      market_array = []
      farmar_data = CSV.read("./support/markets.csv")
      farmar_data.each do |csv|
      @m = Market.new(csv[0], csv[1], csv[2], csv[3], csv[4], csv[5], csv[6])
      market_array.push(@m)
    end
      return market_array
    end

    def self.find(id)
      farmar_data = Market.all
      farmar_data.find do |data|
        if data.id == id
          return data
        end
      end
    end

    def initialize
      object =
    end




  end
end
