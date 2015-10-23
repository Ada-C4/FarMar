module FarMar
  class Vendor
    attr_accessor :id, :name, :employee_no, :market_id
    def initialize(vendor_hash)
      @id = vendor_hash[:id].to_i
      @name = vendor_hash[:name]
      @employee_no = vendor_hash[:employee_no].to_i
      @market_id = vendor_hash[:market_id].to_i
    end

    def self.all
      if @vendor_array.nil? || @vendor_array.empty?
        @vendor_array = CSV.read("support/vendors.csv").map do |line|
          Vendor.new(
           id: line[0],
           name: line[1],
           employee_no: line[2],
           market_id: line[3])
        end
      end
        return @vendor_array
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
      return FarMar::Market.find(@market_id)
    end

    def products
      possibilities = FarMar::Product.all
      associated_products = possibilities.find_all do |each|
        @id == each.vendor_id
      end
      return associated_products
    end

    def sales
      possibilities = FarMar::Sale.all
      associated_sales = possibilities.find_all do |each|
        @id == each.vendor_id
      end
      return associated_sales
    end

    def revenue
      revenue = 0
      self.sales.each do |sale|
        revenue += sale.amount.to_i
      end
      return revenue
    end

    def self.by_market(market_id)
      #possibilities = self.all
      #vendor_party = possibilities.find_all do |each|
        #market_id == each.market_id
      return self.all.find_all do |each|
        market_id == each.market_id
      end
      #return vendor_party
    end
  end
end
