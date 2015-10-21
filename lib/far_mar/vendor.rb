module FarMar

  class Vendor

    attr_reader :id, :name, :employees, :market_id

    def initialize(id, name, employees, market_id)
      @id = id.to_i
      @name = name
      @employees = employees.to_i
      @market_id = market_id.to_i
    end

    def self.all
      vendor_array = CSV.read("./support/vendors.csv")

      vendor_array.map! do |vendor|
        FarMar::Vendor.new(vendor[0],vendor[1],vendor[2],vendor[3])
      end
        return vendor_array
    end

    def self.find(id)
      FarMar::Vendor.all.find do |vendor|
        vendor.id == id
      end
    end

  end

end
