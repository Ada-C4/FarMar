module FarMar
  class Market

    attr_accessor :market_array, :all_markets_array

    @@num_of_markets = 0

  # Each individual market has many vendors associated with it. The `FarMar::Market` data, in order in the CSV, consists of:
  #
  # 1. ID - (Fixnum) a unique identifier for that market
  # 2. Name - (String) the name of the market (not guaranteed unique)
  # 3. Address - (String) street address of the market
  # 4. City - (String) city in which the market is located
  # 5. County - (String) county in which the market is located
  # 6. State - (String) state in which the market is located
  # 7. Zip - (String) zipcode in which the market is located

    def initialize
      @market_array = CSV.read("./support/markets.csv")
      @id = @market_array[@@num_of_markets][0]
      @name = @market_array[@@num_of_markets][1]
      @address = @market_array[@@num_of_markets][2]
      @city = @market_array[@@num_of_markets][3]
      @county = @market_array[@@num_of_markets][4]
      @state = @market_array[@@num_of_markets][5]
      @zip = @market_array[@@num_of_markets][6]
      @@num_of_markets += 1
    end

# - `self.all` - returns a collection of Market instances, representing all of the markets described in the CSV
    def self.all
      market_array = CSV.read("./support/markets.csv")
      @all_markets_array = []
      @@num_of_markets = 0
      while @@num_of_markets < (market_array.length) do
        @all_markets_array.push(FarMar::Market.new)
      end
      return @all_markets_array
    end
#
# # - `self.find(id)` - returns an instance of Market where the value of the `id` field in the CSV matches the passed parameter.
#
#     def self.find(id)
#       @all_markets_array.find do |x|
#         x = id
#       end
#     end

# - `vendors` - returns a collection of `FarMar::Vendor` instances that are associated with the market by the `market_id` field.

  end
end
