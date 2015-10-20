module FarMar
  class Product
    attr_reader :id, :name, :vendor_id

    def initialize(product_hash)
      product_hash.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def self.convert_to_product_hash(product_array)
      product_hash = {}
      product_hash[:id] = product_array[0].to_i
      product_hash[:name] = product_array[1]
      product_hash[:vendor_id] = product_array[2].to_i
    end
  end
end
