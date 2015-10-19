module FarMar
  class Product

    def self.all
      products = CSV.read("./support/products.csv")
      return products
    end

  end
end
