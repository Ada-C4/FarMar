module FarMar
  class Sales
    def initialize
      array_of_sales = CSV.read("./support/sales.csv")
    end
  end
end
