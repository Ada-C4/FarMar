module FarMar
  class Market < FarMar_Base
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    FILENAME = './support/markets.csv'

    def initialize(market_hash)
      super(market_hash)
    end

    def self.all_objects
      @@all_objects ||= self.all
    end

    # Converts an array to a hash for passing to market instantiation
    def self.convert_to_hash(market_array)
      market_hash = {}
      market_hash[:id] = market_array[0].to_i
      market_hash[:name] = market_array[1]
      market_hash[:address] = market_array[2]
      market_hash[:city] = market_array[3]
      market_hash[:county] = market_array[4]
      market_hash[:state] = market_array[5]
      market_hash[:zip] = market_array[6]
      return market_hash
    end

    # Returns a collection of FarMar::Vendor instances that are associated
    # with the market by the market_id field
    def vendors
      return FarMar::Vendor.by_market(@id)
    end

    # returns a collection of FarMar::Product instances that are associated
    # to the market through the FarMar::Vendor class
    def products
      products = []
      v = vendors
      v.each do |vendor|
        products += vendor.products
      end
      return products
    end
    #
    # # returns the vendor with the highest revenue from a market
    # def preferred_vendor
    #
    # end

    # returns the vendor with the highest revenue for the given date
    def preferred_vendor(date = nil)
      return vendors.max_by { |vend| vend.revenue } if date.nil?
      return nil if date.class != DateTime
      m_vendors = vendors
      rev = m_vendors.map { |vend| vend.day_revenue(date) }
      max_index = rev.each_with_index.max[1]
      return m_vendors[max_index]
    end

    # returns the vendor with the lowest revenue from a market
    def worst_vendor
      return vendors.min_by { |vend| vend.revenue }
    end

    #returns the vendor with the lowest revenue on the given date
    def worst_vendor_on(date)
      return nil if date.class != DateTime
      return nil if date.class != DateTime
      m_vendors = vendors
      rev = m_vendors.map { |vend| vend.day_revenue(date) }
      min_index = rev.each_with_index.min[1]
      return m_vendors[min_index]
    end

  end
end
