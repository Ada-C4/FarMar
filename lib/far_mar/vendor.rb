
module FarMar
  class Vendor
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
    end
  end
end
