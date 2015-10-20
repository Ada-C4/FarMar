module FarMar
  class Market < FarMar_Base
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_hash)
      super(market_hash)
    end

    # Converts an array to a hash for passing to market instantiation
    def self.convert_to_hash(market_array)
      market_hash = {}
      market_hash[:id] = market_array[0].to_i
      market_hash[:name] = market_array[1]
      market_hash[:address] = market_array[2]
      market_hash[:city] = market_array[3]
      market_hash[:county] = market_array[4]
      market_hash[:state] = market_array[5]
      return market_hash
    end

    def self.all
      csv_file = CSV.read("./support/markets.csv")
      # Create empty array which will hold all the market objects
      markets = []
      csv_file.each do |row|
        # Convert the array to a hash
        market_hash = convert_to_hash(row)
        # Create a market object from each row-hash in the csv file
        temp = FarMar::Market.new(market_hash)
        # Push market object to array of markets
        markets.push(temp)
      end
      return markets
    end
  end
end
