module FarMar

  class Product
     attr_accessor :name , :id, :vendor_id

    def initialize (id, name, vendor_id)
      @name = name
      @id = id
      @vendor_id = vendor_id
    end

    def self.all
      @@product_all ||= []
      if @@product_all == []
      product_csv = CSV.read("./support/products.csv")
      product_csv.each do |product|
        new_product = Product.new(product[0].to_i, product[1], product[2].to_i)
        @@product_all.push(new_product)
      end
     end
      return @@product_all
    end

    def self.find(id)
      product_array = self.all
      product_array.find do |product|
        product.id == id
      end
    end

    def self.vendor(id)
      @@product_all.find_all do |product|
        product.vendor_id == id
      end
    end

    def sales
      sales_array = FarMar::Sale.all
      sales_array.find_all do |sale|
        sale.product_id == self.id
      end
    end

    def number_of_sales
      return self.sales.length
    end

  end
end
