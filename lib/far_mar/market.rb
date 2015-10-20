require 'csv'

module FarMar
  class Market
    attr_accessor :id, :name, :address, :city, :county, :state, :zip
    def initialize()
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    # def self.all
    #   #returns a collection of Market instances, representing all of the markets described in the CSV
    #
    #   return market_list
    # end
  end
end
