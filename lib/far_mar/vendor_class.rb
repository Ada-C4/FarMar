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

    def initialize(id, name, employees_count, market_id)
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
      all_vend_instances.push(self.new(id, name, employees_count, market_id))
      end
      return all_vend_instances
    end

# - `self.find(id)` - returns an instance of Vendor where the value of the `id` field in the CSV matches the passed parameter.
    def self.find_vendor(vend_id)
      var = []
      self.all.find_all do |single_vend|
        if single_vend.id == vend_id.to_s
          var.push(single_vend)
          return var
        end
      end
    end

# - `find_vend_things` - returns an array of all of the vendor item instances from a given class
    def find_vend_things(vend_id, class_name)
      case class_name
      when "product"
        item_array = FarMar::Product.all
      when "sale"
        item_array = FarMar::Sale.all
      end
      vendors_items = []
      item_array.find_all do |single_item|
        if single_item.vendor_id == vend_id.to_s
          vendors_items.push(single_item)
        end
      end
      return vendors_items
    end

# - `market` - returns the `FarMar::Market` instance that is associated with this vendor using the `FarMar::Vendor` `market_id` field
  def market(vend_id)
    vend = FarMar::Vendor.find_vendor(vend_id)
    market = FarMar::Market.find_market(vend[0].market_id)
    return market
  end

# - `products` - returns a collection of `FarMar::Product` instances that are associated by the `FarMar::Product` `vendor_id` field.
  def products(vend_id)
    find_vend_things(vend_id, "product")
  end

# - `sales` - returns a collection of `FarMar::Sale` instances that are associated by the `vendor_id` field.
  def sales(vend_id)
    find_vend_things(vend_id, "sale")
  end

# - `revenue` - returns the the sum of all of the vendor's sales (in cents)
  def revenue(vend_id)
    total_sales = 0
    sales(vend_id).each do |money|
      total_sales += money.amount.to_i
    end
    return total_sales
  end

# # - `self.by_market(market_id)` - returns all of the vendors with the given `market_id`
  def self.by_market(mkt_id)
    var = []
    FarMar::Vendor.all.find_all do |seller|
      if seller.market_id == mkt_id.to_s
        var.push(seller)
      end
    end
    return var
  end

  end
end
