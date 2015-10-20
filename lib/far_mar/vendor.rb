module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end

    def self.all
      CSV.read("support/vendors.csv").map do |line|
        FarMar::Vendor.new(line[0].to_i, line[1], line[2].to_i, line[3].to_i)
      end
    end

    def self.find(id)
      match = CSV.open("support/vendors.csv").find { |n| n[0].to_i == id}
      return FarMar::Vendor.new(match[0].to_i, match[1], match[2].to_i, match[3].to_i)
    end

    def market
      return FarMar::Market.all.find {|market| market.id == @id}
    end
  end
end
