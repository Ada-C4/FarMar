module FarMar

  class Product
    attr_accessor :id, :name, :vendor_id
    def initialize(product_hash)
      @id = product_hash[:id]
      @name= product_hash[:name]
      @vendor_id= product_hash[:vendor_id]
    end

    def self.all
      @@products_all ||= []
      if @@products_all == []
        CSV.read("support/products.csv").each do |id, name, vendor_id|
          #binding.pry
          product_hash = {:id => id.to_i, :name => name, :vendor_id => vendor_id}
          product = FarMar::Product.new(product_hash)
          @@products_all.push(product)
        end
      end
      return @@products_all
    end

    def self.find(id)
      Product.all.find do |product|
        id == product.id
      end
    end

    def self.by_vendor(vendor_id)
    end  

    def list_vendors
    end

    def list_sales
    end

    def number_of_sales
    end
  end
end
