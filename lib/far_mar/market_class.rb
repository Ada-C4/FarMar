module FarMar
  class Market
    def initialize
      market_array = CSV.read("./support/markets.csv")
    end
  end
end
