module FarMar
  class Product

  # Each product belongs to a vendor. The `vendor_id` field refers to the `FarMar::Vendor` ID field. The `FarMar::Product` data, in order in the CSV, consists of:
  #
  # 1. ID - (Fixnum) uniquely identifies the product
  # 2. Name - (String) the name of the product (not guaranteed unique)
  # 3. Vendor_id - (Fixnum) a reference to which vendor sells this product

    def initialize
      array_of_product = CSV.read("./support/products.csv")
    end
  end
end
