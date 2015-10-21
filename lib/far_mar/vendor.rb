module FarMar
  class Vendor
    attr_accessor :id, :name, :no_of_employees, :market_id
      def initialize(id, name, no_of_employees, market_id)
        @id = id.to_i
        @name = name
        @no_of_employees = no_of_employees
        @market_id = market_id.to_i
      end

      def self.all
        #returns a collection of vendor instances, representing all of the vendors described in the CSV
        vendor_array = []
        CSV.read("./support/vendors.csv").each do |vendor|
          list_of_vendors = Vendor.new(vendor[0], vendor[1], vendor[2], vendor[3])
          vendor_array.push(list_of_vendors)
        end
        return vendor_array
      end

      def self.find(id)
        vendor_array = self.all
        vendor_array.find {|i| i.id == id}
      end

  end
end
