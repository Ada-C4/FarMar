
module FarMar
  class Vendor
    attr_reader :id, :name, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end

    def self.all
      all_vendors = []

      CSV.read("./support/vendors.csv").each do |line|
        y = FarMar::Vendor.new(line[0].to_i, line[1], line[2].to_i, line[3].to_i)
        all_vendors.push(y)
      end

      return all_vendors
    end

    def self.find(id)
      FarMar::Vendor.all.find do |vendor_instance|
        vendor_instance.id == id
      end
    end

    def market
      FarMar::Market.all.find do |market_instance|
        market_instance.id == @market_id
      end
    end

    def products
      FarMar::Product.all.find_all do |product_instance|
        product_instance.vendor_id == @id
      end
    end
  end
end
