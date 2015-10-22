require "pry"
module FarMar

  class Vendor
    attr_accessor :id, :name, :team_size, :market_id
    def initialize(vendor_hash)
      @id = vendor_hash[:id].to_i
      @name = vendor_hash[:name]
      @team_size = vendor_hash[:team_size].to_i
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
      FarMar::Market.find(market_id).list_vendors
      #list = FarMar::Market.list_vendors
    end

    def list_markets
      FarMar::Market.find(market_id)
    end

    def list_products
      product_list = []
      FarMar::Product.all.each do |product|
        if id == product.vendor_id
          product_list.push(product)
        end
      end
      product_list
    end

    def list_sales
      sales_list = []
      FarMar::Sale.all.each do |sale|
        if id == sale.vendor_id
          sales_list.push(sale)
        end
      end
      sales_list
    end

    def revenue
    end
  end
end
