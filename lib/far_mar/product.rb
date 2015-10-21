module FarMar

  class Product
     attr_accessor :name , :id, :vendor_id

    def initialize (id, name, vendor_id)
      @name = name
      @id = id
      @vendor_id = vendor_id
    end

    def self.all
      product_array =[]
      product_csv = CSV.read("./support/products.csv")
      product_csv.each do |product|
        new_product = Product.new(product[0].to_i, product[1], product[2].to_i)
        product_array.push(new_product)
      end
      return product_array
    end

    def self.find(id)
      product_array = self.all
      product_array.find do |product|
        product.id == id
      end
    end


  end
end
