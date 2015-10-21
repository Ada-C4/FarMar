module FarMar
  class Vendor
    attr_reader :id, :market_id

    def initialize(vendor_info)
      @id = vendor_info[0].to_i
      @name = vendor_info[1]
      @number_of_employees = vendor_info[2].to_i
      @market_id = vendor_info[3].to_i
    end

    def self.all
      vendor_array = []
      CSV.read("./support/vendors.csv").each do |vendor|
        new_vendor = FarMar::Vendor.new(vendor)
        vendor_array.push(new_vendor)
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
