module FarMar
  class Product

    def self.all
      products_csv = CSV.read("./support/products.csv")
      product_instances = []
      products_csv.each do |row|
        product_instances.push(Product.new(row[0].to_i, row[1], row[2].to_i))
      end
      return product_instances
    end
    def self.find(id)
        self.all.find do |product|
        product.product_id == id
      end
    end

  end
end
