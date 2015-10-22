module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def vendor
      Vendor.find(@vendor_id)
    end

    def sales
      sales_list = Sale.all

      return sales_list.find_all do |instance|
        @id == instance.product_id
      end
    end

    def number_of_sales
      self.sales.length
    end

    def self.by_vendor(vendor_id)
      products_list = self.all

      return products_list.find_all do |product|
        vendor_id == product.vendor_id
      end
    end

    def self.all
      @@products_list ||= []

      if @@products_list == []
        CSV.foreach("./support/products.csv") do |row|
          product = Product.new(row[0], row[1], row[2])
          @@products_list.push(product)
        end
      end

      return @@products_list
    end

    def self.find(id)
      products_list = self.all

      products_list.find do |instance|
        instance.id == id
      end
    end

    def self.most_revenue(n)
      products_list = self.all

      products_list.max_by(n) do |product|
        product.sales.inject(0) { |sum, sale| sum + sale.amount }
      end
    end

  end
end
