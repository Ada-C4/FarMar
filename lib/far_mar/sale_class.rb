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
      @purchase_time =  DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
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
    all_the_sales = self.all
    all_the_sales.find do |single_sale|
      if single_sale.id == sale_id.to_s
        return single_sale
      end
    end
  end

# - `find_sale_things` - returns and array of all of the sale item related instances from a given class

  def find_sale_things(class_type)
    case class_type
    when "product"
      item_array = FarMar::Product.all
      compare = self.product_id.to_s
    when "vendor"
      item_array = FarMar::Vendor.all
      compare = self.vendor_id.to_s
    end
    item_array.find_all do |sale_item|
      if sale_item.id == compare
        return sale_item
      end
    end
  end


# - `vendor` - returns the `FarMar::Vendor` instance that is associated with this sale using the `FarMar::Sale` `vendor_id` field
  def vendor
    find_sale_things("vendor")
  end

# - `product` - returns the `FarMar::Product` instance that is associated with this sale using the `FarMar::Sale` `product_id` field

  def product
    find_sale_things("product")
  end

# - `self.between(beginning_time, end_time)` - returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

  def self.between(begin_time, end_time)
      time_array = []
      self.all.find_all do |purchase|
        if begin_time <= purchase.purchase_time && end_time >= purchase.purchase_time
          time_array.push(purchase)
        end
      end
      return time_array
  end

  end
end
