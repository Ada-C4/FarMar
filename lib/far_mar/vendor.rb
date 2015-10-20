module FarMar
  class Vendor

      attr_accessor :vendors, :vendor_id, :market_id
      def initialize(vendor_hash)
        @vendor_id        = vendor_hash[:id].to_i
        @vendor_name      = vendor_hash[:name]
        @num_of_employees = vendor_hash[:employees]
        @market_id        = vendor_hash[:market_id].to_i
      end

      def self.all
        @vendors = []
        vendors_csv = CSV.read("support/vendors.csv")

        vendors_csv.each do |id, name, num_employees, market_id|
          hash = {:id => id, :name => name, :employees => num_employees, :market_id => market_id}
          vendor = FarMar::Vendor.new(hash)
          @vendors.push(vendor)
        end
        return @vendors
      end

      def self.find(id)
        @vendors.find do |vendor|
          vendor.vendor_id == id
        end
      end

      # Returns the FarMar::Market instance that is associated with the vendor
      def market
        FarMar::Market.find(self.market_id)
      end

  end
end
