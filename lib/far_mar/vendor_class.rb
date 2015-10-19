module FarMar
  class Vendor

  # Each vendor belongs to a market, the `market_id` field refers to the `FarMar::Market` ID field.
  # Each vendor has many products for sell. The `FarMar::Vendor` data, in order in the CSV, consists of:
  #
  # 1. ID - (Fixnum) uniquely identifies the vendor
  # 2. Name - (String) the name of the vendor (not guaranteed unique)
  # 3. No. of Employees - (Fixnum) How many employees the vendor has at the market
  # 4. Market_id - (Fixnum) a reference to which market the vendor attends

    def initialize
      array_of_vendor = CSV.read("./support/vendors.csv")
    end
  end
end
