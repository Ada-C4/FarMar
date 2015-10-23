module FarMar
  class Product
    attr_accessor :product_id, :product_name, :vendor_id
    def initialize(product_hash)
      @product_id   = product_hash[:id].to_i
      @product_name = product_hash[:name]
      @vendor_id    = product_hash[:vendor_id].to_i
    end

    # Return a collection of all Product instances, representing all the products described in the CSV
    def self.all(csv = "support/products.csv")
      # Only reload the CSV if @products is empty array
      @@products ||= []
      if @@products == []
        # Create a new Product object for each row in the CSV and add the products to an array
        products_csv = CSV.read(csv)
        products_csv.each do |id, name, vendor_id|
          hash = {:id => id, :name => name, :vendor_id => vendor_id}
          product = FarMar::Product.new(hash)
          @@products.push(product)
        end
      end
      return @@products
    end

    # Returns an instance of Product with the passed in ID
    def self.find(id)
      @@products.find { |product| product.product_id == id }
    end

    # Returns the FarMar::Vendor instance that is associated with the product
    def vendor
      FarMar::Vendor.find(self.vendor_id)
    end

    # Returns a collection for FarMar::Sale instances associated with the product
    def sales(csv = "./support/sales.csv")
      all_sales = FarMar::Sale.all(csv)
      matched_sales = all_sales.find_all { |sale| sale.product_id == self.product_id }
      return matched_sales
    end

    # Returns the number of times this product has been sold
    def number_of_sales
      return self.sales.length
    end

    # Returns all of the products with the given Vendor ID
    def self.by_vendor(vendor_id)
      all_products = FarMar::Product.all
      matched_products = all_products.find_all { |product| product.vendor_id == vendor_id }
      return matched_products
    end

    # Returns the top n product instances ranked by total revenue
    # Written so that the method only runs on a partial version of the data.  Needs to be optimized so it can run on the full data without taking forever
    def self.most_revenue(n)
      return_array = []
      @@sales = []
      @@products = []
      products = FarMar::Product.all("./test_data/test_products.csv")
      #products = FarMar::Product.all("./support/products.csv")
      product_sales = Hash.new(0)
      products.each do |product|
        associated_sales = product.sales("./test_data/test_sales.csv")
        #associated_sales = product.sales("./support/sales.csv")
        revenue = 0
        associated_sales.each do |sale|
          revenue += sale.amount
        end
        product_sales[product.product_id] = revenue
      end
      sorted = product_sales.sort_by { |product, rev| rev }
      sorted.reverse!
      best_products = sorted[0...n]
      best_products.each do |product|
        return_array.push(FarMar::Product.find(product[0]))
      end
      return return_array
    end

  end
end
