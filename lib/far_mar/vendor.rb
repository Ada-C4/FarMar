module FarMar
  class Vendor

    attr_reader :vendor_id, :name, :employees, :market_id

    def initialize(vendor_id, name, employees, market_id)
      @vendor_id = vendor_id
      @name = name
      @employees = employees
      @market_id = market_id
    end

    def self.all
      vendor_csv = CSV.read("./support/vendors.csv")
      vendor_instances = []
      vendor_csv.each do |row|
        vendor_instances.push(Vendor.new(row[0].to_i, row[1], row[2], row[3].to_i))
      end
      return vendor_instances
    end
    def self.find(id)
        self.all.find do |vendor|
        vendor.vendor_id == id
      end
    end
  end
end
