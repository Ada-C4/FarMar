module FarMar
  class Products
    def initialize
      array_of_products = CSV.read("./support/products.csv")
    end
  end
end
