module FarMar
  class Markets
    def initialize
      array_of_markets = CSV.read("./support/markets.csv")
    end
  end
end
