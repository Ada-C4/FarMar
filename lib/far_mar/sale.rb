module FarMar
  class Sale

    def self.all
      sales = CSV.read("./support/sales.csv")
      return sales
    end

  end
end
