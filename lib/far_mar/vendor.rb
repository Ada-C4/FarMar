module FarMar
  class Vendor < FarMar_Base
    attr_reader :id, :name, :emp_num, :market_id
    FILENAME = './support/vendors.csv'

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
  end
end
