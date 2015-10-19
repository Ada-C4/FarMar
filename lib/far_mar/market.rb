module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(market_hash)
      # This block sets each key to an instance variable
      market_hash.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    # Converts an array to a hash for passing to owner instantiation
    def self.convert_to_market_hash(market_array)
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
        market_hash = self.convert_to_market_hash(row)
        # Create a market object from each row-hash in the csv file
        temp = FarMar::Market.new(market_hash)
        # Push account object to array of accounts
        markets.push(temp)
      end
      return markets
    end
  end
end
