module FarMar
  class Vendor

    def self.all
      vendors = CSV.read("./support/vendors.csv")
      return vendors
    end

  end
end
