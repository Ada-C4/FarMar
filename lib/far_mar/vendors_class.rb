module FarMar
  class Vendors
    def initialize
      array_of_vendors = CSV.read("./support/vendors.csv")
    end
  end
end
