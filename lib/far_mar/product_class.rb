module FarMar
  class Product

  attr_accessor :id, :name, :vendor_id

  # Each product belongs to a vendor. The `vendor_id` field refers to the `FarMar::Vendor` ID field. The `FarMar::Product` data, in order in the CSV, consists of:
  #
  # 1. ID - (Fixnum) uniquely identifies the product
  # 2. Name - (String) the name of the product (not guaranteed unique)
  # 3. Vendor_id - (Fixnum) a reference to which vendor sells this product

    def initialize(id, name, vendor_id)
      @id = id
      @name = name
      @vendor_id = vendor_id
    end

# - `self.all` - returns a collection of Product instances, representing all of the products described in the CSV
def self.all
  product_array = CSV.read("./support/products.csv")
  all_products_array = []
    product_array.each do |single_array|
      id = single_array[0]
      name = single_array[1]
      vendor_id = single_array[2]
    all_products_array.push(FarMar::Product.new(id, name, vendor_id))
    end
  return all_products_array
end

# - `self.find(id)` - returns an instance of Product where the value of the `id` field in the CSV matches the passed parameter.
  def self.find_product(product_id)
    all_the_products = FarMar::Product.all
      all_the_products.find do |single_product|
        if single_product.id == product_id.to_s
        return single_product
      end
      end
  end

# - `find_product_things` - returns and array of all of the product item instances from a given class

  def find_product_things(pd_id, class_name)
    case class_name
    when "sale"
      item_array = FarMar::Sale.all
    end
    products_items = []
    item_array.find_all do |single_item|
      if single_item.product_id == pd_id.to_s
        products_items.push(single_item)
      end
    end
    return products_items
  end

# - `vendor` - returns the `FarMar::Vendor` instance that is associated with this vendor using the `FarMar::Product` `vendor_id` field

  def vendor(prod_id)
    prod = FarMar::Product.find_product(prod_id)
    vendor = FarMar::Vendor.find_vendor(prod.vendor_id)
    return vendor[0]
  end

# - `sales` - returns a collection of `FarMar::Sale` instances that are associated using the `FarMar::Sale` `product_id` field.

  def sales(prod_id)
    class_name = "sale"
    find_product_things(prod_id, class_name)
  end

# - `number_of_sales` - returns the number of times this product has been sold.

#   def number_of_sales(prod_id)
#
#   end
# #
# # - `self.by_vendor(vendor_id)` - returns all of the products with the given `vendor_id`
#
#   def self.by_vendor(vendor_id)
#
#   end

  end
end
