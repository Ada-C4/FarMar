module FarMar

  class Product
    attr_accessor :id, :name, :vendor_id
    def initialize(product_hash)
      @id = product_hash[:id].to_i
      @name= product_hash[:name]
      @vendor_id= product_hash[:vendor_id].to_i
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
      FarMar::Vendor.find(vendor_id).list_products
    end

    def list_vendors
      FarMar::Vendor.find(vendor_id)
    end

    def list_sales
      sales_list = []
      FarMar::Sale.all.each do |sale|
        if id == sale.product_id
          sales_list.push(sale)
        end
      end
      sales_list
    end

    def number_of_sales
      list_sales.length
    end
  end
end
