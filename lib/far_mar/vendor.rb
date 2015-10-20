module FarMar
  class Vendor
    attr_accessor :id, :name, :no_of_employees, :market_id
      def initialize(id, name, no_of_employees, market_id)
        @id = id
        @name = name
        @no_of_employees = no_of_employees
        @market_id = market_id
      end

      def self.all
        #returns a collection of vendor instances, representing all of the vendors described in the CSV
        vendor_array = []
        CSV.read("./support/vendors.csv").each do |vendor|
          print vendor
          list_of_vendors = Vendor.new(vendor[0], vendor[1], vendor[2], vendor[3])
          vendor_array.push(list_of_vendors)
        end
      end
  end
end
