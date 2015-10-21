module FarMar
  class Sale

  attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

  # Each sale belongs to a vendor __AND__ a product. The `vendor_id` and `product_id` fields refer to the `FarMar::Vendor` and `FarMar::Product` ID fields, respectively. The `FarMar::Sale` data, in order in the CSV, consists of:
  #
  # 1. ID - (Fixnum) uniquely identifies the product
  # 2. Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
  # 3. Purchase_time - (Datetime) when the sale was completed
  # 4. Vendor_id - (Fixnum) a reference to which vendor completed the sale
  # 5. Product_id - (Fixnum) a refere

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

# - `self.all` - returns a collection of Sale instances, representing all of the markets described in the CSV
    def self.all
      array_of_sale = CSV.read("./support/sales.csv")
      all_sales_array = []
      array_of_sale.each do |single_sale|
        id = single_sale[0]
        amount = single_sale[1]
        purchase_time = single_sale[2]
        vendor_id = single_sale[3]
        product_id = single_sale[4]
      all_sales_array.push(FarMar::Sale.new(id, amount, purchase_time, vendor_id, product_id))
      end
      return all_sales_array
    end

# - `self.find(id)` - returns an instance of Sale where the value of the `id` field in the CSV matches the passed parameter.
  def self.find_sale(sale_id)
    all_the_sales = FarMar::Sale.all
    all_the_sales.find do |single_sale|
      if single_sale.id == sale_id.to_s
        var = []
        var = ["#{single_sale.id}", "#{single_sale.amount}", "#{single_sale.purchase_time}", "#{single_sale.vendor_id}", "#{single_sale.product_id}"]
        return var
      end
    end
  end

# - `vendor` - returns the `FarMar::Vendor` instance that is associated with this sale using the `FarMar::Sale` `vendor_id` field

# - `product` - returns the `FarMar::Product` instance that is associated with this sale using the `FarMar::Sale` `product_id` field

# - `self.between(beginning_time, end_time)` - returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

  end
end
