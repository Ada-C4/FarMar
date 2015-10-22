module FarMar
  class Product
    attr_reader :id, :vendor_id

    def initialize(product_info)
      @id = product_info[0].to_i
      @name = product_info[1]
      @vendor_id = product_info[2].to_i
    end

    def self.all
      @@product_array ||= []

      if @@product_array == []
        CSV.read("./support/products.csv").each do |product|
          new_product = FarMar::Product.new(product)
          @@product_array.push(new_product)
        end
      end

      return @@product_array
    end

    def self.find(id)
      FarMar::Product.all.find do |product|
        product.id == id
      end
    end

    def vendor
      FarMar::Vendor.all.find do |vendor|
        vendor.id == self.vendor_id
      end
    end

    def sales
      sales = FarMar::Sale.all.find_all do |sale|
        sale.product_id == self.id
      end
      return sales
    end

    def product_revenue
      product_revenue = 0
      sales = self.sales
      sales.each do |sale|
        product_revenue = product_revenue + sale.amount
      end
      return product_revenue
    end

    def number_of_sales
      return self.sales.length
    end

    def self.by_vendor(vendor_id)
      vendor_products = FarMar::Product.all.find_all do |product|
        product.id == vendor_id
      end
      return vendor_products
    end

    def self.most_revenue(n)
      sorted_products = FarMar::Product.all.sort_by do |product|
        product_revenue = 0
        product_sales = product.sales
        product_sales.each do |sale|
          product_revenue = product_revenue + sale.amount
        end
        product_revenue
      end
      sorted_products.reverse!
      return sorted_products[0..n-1]
    end

  end
end
