module FarMar
  class Product

    attr_reader :product_id, :name, :vendor_id

    def initialize(product_id, name, vendor_id)
      @product_id = product_id
      @name = name
      @vendor_id = vendor_id
    end


    def self.all
      @@product_instances ||= [] #@@product = @@product || []
      if @@product_instances == []
        products_csv = CSV.read("./support/products.csv")
        products_csv.each do |row|
          @@product_instances.push(Product.new(row[0].to_i, row[1], row[2].to_i))
        end
      end
      return @@product_instances
    end
    def self.find(id)
        self.all.find do |product|
        product.product_id == id
      end
    end

    def vendor
      product_vendor_array = FarMar::Vendor.all
      product_vendor_array.each do |row|
        if row.vendor_id == @vendor_id
          return row
        end
      end
    end

    def sales
      product_sales_array = []
      sale_array = FarMar::Sale.all
      sale_array.each do |sale|
        if sale.product_id == @product_id
          product_sales_array.push(sale)
        end
      end
      return product_sales_array
    end

    def number_of_sales
      return sales.length
    end

    def self.by_vendor(vendor_id)
      vendor = FarMar::Vendor.find(vendor_id)
      return vendor.products
    end

  end
end
