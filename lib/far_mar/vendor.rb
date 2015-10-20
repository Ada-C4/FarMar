module FarMar
  class Vendor
     attr_accessor :name, :id, :no_employess, :market_id

    def initialize (id, name, no_employess, market_id)
      @name = name
      @id = id
      @no_employess = no_employess
      @market_id = market_id
    end

    def self.all
      vendor_array =[]
      vendor_csv = CSV.read("./support/vendors.csv")
      vendor_csv.each do |sale|
        new_vendor = Vendor.new(sale[0], sale[1].to_i, sale[2], sale[3].to_i)
        vendor_array.push(new_vendor)
      end
      return vendor_array
    end
  end
end
