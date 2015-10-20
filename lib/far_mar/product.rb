require "csv"

module FarMar
  class Product
    def self.all
      # returns a collection of product instances
      # representing all of the products described in the CSV
    end

    def self.find(id)
      # Returns an instance of product where the value of the id in the csv
      # matches the passed parameter.
    end

  end
end
