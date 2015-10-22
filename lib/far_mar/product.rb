module FarMar

  class Product

    attr_reader :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def self.all
      @@products_all ||= []

      if @@products_all == []

        product_array = CSV.read("./support/products.csv")

        product_array.map! do |product|
          FarMar::Product.new(product[0],product[1],product[2])
        end
        @@products_all = product_array
      end
        return @@products_all
    end

    def self.find(id)
      FarMar::Product.all.find do |product|
        product.id == id
      end
    end

    def vendor
      FarMar::Vendor.all.find do |vendor|
        vendor.id == @vendor_id
      end
    end

    def sales
      productsales = FarMar::Sale.all.find_all do |sale|
        sale.product_id == @id
      end
      return productsales
    end

    def number_of_sales
      self.sales.length
    end

    def self.by_vendor(vendor_id)
      product_vendors = FarMar::Product.all.find_all do |product|
        product.vendor_id == vendor_id
      end
      return product_vendors
    end


  end

end
