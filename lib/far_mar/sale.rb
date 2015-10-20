require "csv"

module FarMar
  class Sale
    def self.all
      # returns a collection of sale instances
      # representing all of the sales described in the CSV
    end

    def self.find(id)
      # Returns an instance of sale where the value of the id in the csv
      # matches the passed parameter.
    end

  end
end
