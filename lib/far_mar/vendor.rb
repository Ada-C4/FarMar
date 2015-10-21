module FarMar
  class Vendor
    attr_accessor :id, :name, :address, :market_id
      def initialize(vendor_hash)
        @id = vendor_hash[:id]
        @name = vendor_hash[:name]
        @address = vendor_hash[:address]
        @market_id = vendor_hash[:market_id]
      end

      def self.all()
        vendors_csv = CSV.read("./support/vendors.csv")
        vendors_array = []
        vendors_csv.each do |line|
        new_vendor = FarMar::Vendor.new(
        {
          :id => line[0].to_i,
          :name => line[1],
          :address => line[2],
          :market_id => line[3].to_i
          }
        )
        vendors_array.push(new_vendor)
      end
      return vendors_array
      end

      def self.find(id)
        vendors_csv = CSV.read("./support/vendors.csv")
        match = vendors_csv.find {|vendor| vendor[0].to_i == id}
        new_vendor = FarMar::Vendor.new(
        {
          :id => match[0].to_i,
          :name => match[1],
          :address => match[2],
          :market_id => match[3].to_i
          }
        )
        return new_vendor
      end


      def id
        return @id
      end
  end
end
