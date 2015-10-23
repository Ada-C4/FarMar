module FarMar
  class Vendor

      attr_accessor :vendors, :vendor_id, :market_id, :vendor_name
      def initialize(vendor_hash)
        @vendor_id        = vendor_hash[:id].to_i
        @vendor_name      = vendor_hash[:name]
        @num_of_employees = vendor_hash[:employees]
        @market_id        = vendor_hash[:market_id].to_i
      end

      # Returns a collection of Vendor instances, representing all the vendors described in the CSV
      def self.all(csv = "support/vendors.csv")
        # Only reload the CSV if @vendors is empty array
        @@vendors ||= []
        # Checking that the array doesn't contain test data
        if @@vendors.length == 48
          @@vendors = []
        end
        if @@vendors == []
          vendors_csv = CSV.read(csv)
          vendors_csv.each do |id, name, num_employees, market_id|
            hash = {:id => id, :name => name, :employees => num_employees, :market_id => market_id}
            vendor = FarMar::Vendor.new(hash)
            @@vendors.push(vendor)
          end
        end
        return @@vendors
      end

      # Returns an instance of Vendor that matches the search ID
      def self.find(id)
        @@vendors.find do |vendor|
          vendor.vendor_id == id
        end
      end

      # Returns the FarMar::Market instance that is associated with the vendor
      def market
        FarMar::Market.find(self.market_id)
      end

      # Returns a collection of FarMar::Product instances that are associated with the vendor
      def products
        products = FarMar::Product.all
        matched_products = products.find_all { |product| product.vendor_id == self.vendor_id }
        return matched_products
      end

      # Returns a collection of FarMar::Sale instances that are associated with the vendor
      def sales(csv = "./test_data/test_sales.csv")
        sales = FarMar::Sale.all(csv)
        matched_sales = sales.find_all { |sale| sale.vendor_id == self.vendor_id}
        return matched_sales
      end

      # Returns the sum of all the vendor's sale (in cents)
      def revenue
        total = 0
        all_sales = self.sales
        all_sales.each do |sale|
          total += sale.amount
        end
        return total
      end

      # Returns all of the vendors with the given market ID
      def self.by_market(market_id)
        vendors = FarMar::Vendor.all
        matched_vendors = vendors.find_all { |vendor| vendor.market_id == market_id}
        return matched_vendors
      end

      # Returns the top n vendor instances ranked by total revenue
      def self.most_revenue(n)
        return_array = []
        @@sales = []
        @@vendors = []
        #vendors = FarMar::Vendor.all("./test_data/test_products.csv")
        vendors = FarMar::Vendor.all("./test_data/test_vendors.csv")

        vendor_sales = Hash.new(0)
        vendors.each do |vendor|
          associated_sales = vendor.sales("./test_data/test_sales.csv")
          #associated_sales = product.sales("./support/sales.csv")
          revenue = 0
          associated_sales.each do |sale|
            revenue += sale.amount
          end
          vendor_sales[vendor.vendor_id] = revenue
        end
        sorted = vendor_sales.sort_by { |vendor, rev| rev }
        sorted.reverse!
        best_vendors = sorted[0...n]
        best_vendors.each do |vendor|
          return_array.push(FarMar::Vendor.find(vendor[0]))
        end
        return return_array
      end


  end
end
