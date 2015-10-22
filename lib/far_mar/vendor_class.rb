module FarMar
  class Vendor

  attr_accessor :id, :name, :employees_count, :market_id

  # Each vendor belongs to a market, the `market_id` field refers to the `FarMar::Market` ID field.
  # Each vendor has many products for sell. The `FarMar::Vendor` data, in order in the CSV, consists of:
  #
  # 1. ID - (Fixnum) uniquely identifies the vendor
  # 2. Name - (String) the name of the vendor (not guaranteed unique)
  # 3. No. of Employees - (Fixnum) How many employees the vendor has at the market
  # 4. Market_id - (Fixnum) a reference to which market the vendor attends

    def initialize(id,name, employees_count, market_id)
      @id = id
      @name = name
      @employees_count = employees_count
      @market_id = market_id
    end

# - `self.all` - returns a collection of Vendor instances, representing all of the markets described in the CSV
    def self.all
      vendor_array = CSV.read("./support/vendors.csv")
      all_vend_instances = []
      vendor_array.each do |single_vend|
        id = single_vend[0]
        name = single_vend[1]
        employees_count = single_vend[2]
        market_id = single_vend[3]
      all_vend_instances.push(FarMar::Vendor.new(id, name, employees_count, market_id))
      end
      return all_vend_instances
    end

# - `self.find(id)` - returns an instance of Vendor where the value of the `id` field in the CSV matches the passed parameter.
    def self.find_vendor(vend_id)
      all_vends = FarMar::Vendor.all
      all_vends.find do |single_vend|
        if single_vend.id == vend_id.to_s
          var = []
          var = ["#{single_vend.id}", "#{single_vend.name}", "#{single_vend.employees_count}", "#{single_vend.market_id}"]
          return var
        end
      end
    end


# - `market` - returns the `FarMar::Market` instance that is associated with this vendor using the `FarMar::Vendor` `market_id` field
  def market(vend_id)
    vend = FarMar::Vendor.find_vendor(vend_id)
    market = FarMar::Market.find_market(vend[3])
    return market
  end

# - `products` - returns a collection of `FarMar::Product` instances that are associated by the `FarMar::Product` `vendor_id` field.
  def products(vend_id)
    vend = FarMar::Vendor.find_vendor(vend_id)
    product_array = FarMar::Product.all
    vendors_products = []
    product_array.find_all do |single_product|
      if single_product.vendor_id == vend_id.to_s
        vendors_products.push(["#{single_product.id}", "#{single_product.name}", "#{single_product.vendor_id}"])
      end
    end
    return vendors_products
  end

# - `sales` - returns a collection of `FarMar::Sale` instances that are associated by the `vendor_id` field.
  def sales(vend_id)
    vend = FarMar::Vendor.find_vendor(vend_id)
    sales_array = FarMar::Sale.all
    vendors_sales = []
    sales_array.find_all do |single_sales|
      if single_sales.vendor_id == vend_id.to_s
        vendors_sales.push(["#{single_sales.id}", "#{single_sales.amount}", "#{single_sales.purchase_time}", "#{single_sales.vendor_id}", "#{single_sales.product_id}"])
        end
      end
    return vendors_sales
  end

# - `revenue` - returns the the sum of all of the vendor's sales (in cents)

# - `self.by_market(market_id)` - returns all of the vendors with the given `market_id`

  end
end
