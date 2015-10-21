module FarMar
  class Vendor
    attr_accessor :id, :name, :employee_no, :market_id
    def initialize(vendor_hash)
      @id = vendor_hash[:id]
      @name = vendor_hash[:name]
      @employee_no = vendor_hash[:employee_no]
      @market_id = vendor_hash[:market_id]
    end

    def self.all
      vendors = []
      vendor_array = CSV.read("support/vendors.csv")
      vendor_array.each do |line|
      new_vendor = Vendor.new(
        id: line[0],
        name: line[1],
        employee_no: line[2],
        market_id: line[3])
        vendors.push(new_vendor)
      end
      return vendors
    end

    def self.find(id)
      vendor_array = CSV.read("support/vendors.csv")
      matched_line = vendor_array.find do |line|
        line[0].to_i == id
      end
      specific_vendor = Vendor.new(
        id: matched_line[0],
        name: matched_line[1],
        employee_no: matched_line[2],
        market_id: matched_line[3])
    end

    def market
      matched_market = FarMar::Market.all.find_all do |each|
        @id == each.id
      end
      return matched_market
    end

    def products
      possibilities = FarMar::Product.all
      associated_products = possibilities.find_all do |each|
        @id == each.vendor_id
      end
      return associated_products
    end
  end
end
