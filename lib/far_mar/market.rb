require "csv"

module FarMar
  class Market
    attr_accessor

    def self.all
      # returns a collection of Market instances
      # representing all of the markets described in the CSV
    end

    def self.find(id)
      # Returns an instance of Market where the value of the id in the csv
      # matches the passed parameter.
    end

    def vendors(market_id)
      # Given a market ID, RETURN vendors associated with that market.
    end
  end
end
