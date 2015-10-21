module FarMar

  class Vendor
    attr_accessor :id, :name, :team_size, :market_id
    def initialize(vendor_hash)
      @id = vendor_hash[:id].to_i
      @name = vendor_hash[:name]
      @team_size = vendor_hash[:team_size]
      @market_id = vendor_hash[:market_id].to_i
    end

    def self.all
      @@vendors_all ||= []
      if @@vendors_all == []
        CSV.read("support/vendors.csv").each do |id, name, team_size, market_id|
          #binding.pry
          vendor_hash = {:id => id.to_i, :name => name, :team_size => team_size, :market_id => market_id}
          market = FarMar::Vendor.new(vendor_hash)
          @@vendors_all.push(market)
        end
      end
      return @@vendors_all
    end

    def self.find(id)
      Vendor.all.find do |vendor|
        id == vendor.id
      end
    end

    def self.by_market(market_id)
    end

    def list_markets
    end

    def list_products
    end

    def list_sales
    end

    def revenue
    end
  end
end
