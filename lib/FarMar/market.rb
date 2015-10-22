require 'csv'
require 'pry'

module FarMar
  class Market

# self.all - returns a collection of Market instances,
# representing all of the markets described in the CSV

    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(id, name, address, city, county, state, zip)
      @id = id
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

#every time you instantiate object, it contains info about that object.
# foreach: foreach method passes the file name as the argument and
# provides it a block-variable which contains the already-processed row as an array
# review!!!
    def self.all
      @@markets ||= []

      if @@markets == []
# why does @markets need to be an instance variable?
        CSV.foreach('./support/markets.csv') do |row|
          newmarket = Market.new row[0].to_i, row[1].to_s, row[2], row[3].to_s, row[4].to_s, row[5].to_s, row[6].to_s
          @@markets.push(newmarket)
          # binding.pry
        end
      end
        return @@markets
    end

# self.find(id) - returns an instance of Market where the value of the id field in the CSV matches the passed parameter.
# review!!!
    def self.find(id)
    return Market.all.find do |market|
        market.id == id
      end
    end

# vendors - returns a collection of FarMar::Vendor instances
# that are associated with the market by the market_id field.
    def vendors
      all_vendors = []
      FarMar::Vendor.all.find_all do |vendor|
        if vendor.market_id == id
        all_vendors.push(vendor)
        end
      end
     return all_vendors
    end




  end
end
