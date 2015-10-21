module FarMar
  class Vendor < FarMar_Base
    attr_reader :id, :name, :emp_num, :market_id
    FILENAME = './support/vendors.csv'
    @@all_objects = []

    def initialize(vendor_hash)
      super(vendor_hash)
    end

    def self.convert_to_hash(array)
      vendor = {}
      vendor[:id] = array[0].to_i
      vendor[:name] = array[1]
      vendor[:emp_num] = array[2].to_i
      vendor[:market_id] = array[3].to_i
      return vendor
    end

    # returns all of the vendors with the given market_id
    def self.by_market(market_id)
      csv_file = CSV.read(FILENAME)
      matches = csv_file.find_all { |row| row[3].to_i == market_id }
      vendors = []
      matches.each do |vendor_array|
        vendor_hash = convert_to_hash(vendor_array)
        vendors.push(FarMar::Vendor.new(vendor_hash))
      end
      return vendors
    end

     # returns a collection of FarMar::Product instances that are
     # associated by the FarMar::Product vendor_id field
     def products
       return FarMar::Product.by_vendor(@id)
     end
  end
end
