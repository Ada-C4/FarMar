module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id
    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def self.all
      #returns a collection of product instances, representing all of the products described in the CSV
      product_array = []
      product_file = CSV.read("./support/products.csv")
      product_file.each do |product|
        list_of_products = FarMar::Product.new(product[0], product[1], product[2])
        product_array.push(list_of_products)
      end
      return product_array
    end

    def self.find(id)
      #returns an instance of Product where the value in the id field of the CSV file matches the passed parameter
      all.find {|i| i.id == id}
    end

    def vendor
      # returns the FarMar::Market instance that is associated with this vendor
      # using the FarMar::Vendor market_id field
      # vendor_array = []
      # vendor_list = FarMar::Product.all
      # vendor_list.find_all do |i|
      #   if i.id == vendor_id
      #     vendor_array.push(i)
      #   end
      # end
      # return vendor_array

      vendor_list = FarMar::Vendor.all
      vendor_list.find do |vendor|
        vendor.id == vendor_id
      end
    end

    def sales
      #sales - returns a collection
      #of FarMar::Sale instances that are associated
      #using the FarMar::Sale product_id field.
      sales_array = []
      sales_list = FarMar::Sale.all
        sales_list.find_all do |i|
          if i.product_id == id
            sales_array.push(i)
          end
        end
      return sales_array
    end

    def self.by_vendor(vendor_id)
        #returns all of the products with the given vendor_id
        products_sold_by_a_vendor_array = []
        product_list = FarMar::Product.all
        product_list.find_all do |product|
          if product.vendor_id == vendor_id
            products_sold_by_a_vendor_array.push(product)
          end
        end
        return products_sold_by_a_vendor_array
    end

  end
end
