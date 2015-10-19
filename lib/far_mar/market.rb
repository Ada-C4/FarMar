module FarMar
  class Market

    def self.all
      markets = CSV.read("./support/markets.csv")
      return markets
    end

  end
end
