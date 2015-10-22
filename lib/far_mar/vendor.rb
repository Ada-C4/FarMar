module FarMar
  class Vendor
    attr_accessor :id, :name, :num_employees, :market_id
      def initialize(vendor_hash)
        @id = vendor_hash[:id]
        @name = vendor_hash[:name]
        @num_employees = vendor_hash[:num_employees]
        @market_id = vendor_hash[:market_id]
      end

      def self.create_vendor_hash(vendor_array)
        vendor_hash = {}
        vendor_hash[:id] = vendor_array[0].to_i
        vendor_hash[:name] = vendor_array[1]
        vendor_hash[:num_employees] = vendor_array[2].to_i
        vendor_hash[:market_id] = vendor_array[3].to_i
        return vendor_hash
      end

      def self.all()
        vendors_csv = CSV.read("./support/vendors.csv")
        vendors_array = []
        vendors_csv.each do |line|
        new_vendor = FarMar::Vendor.new(self.create_vendor_hash(line))
        vendors_array.push(new_vendor)
      end
      return vendors_array
      end

      def self.find(id)
        vendors_csv = CSV.read("./support/vendors.csv")
        match = vendors_csv.find {|vendor| vendor[0].to_i == id}
        new_vendor = FarMar::Vendor.new(self.create_vendor_hash(match))
        return new_vendor
      end


      def id
        return @id
      end

      def market_id
        return @market_id
      end

      def find_market(market_id)
        return FarMar::Market.find(market_id)
      end

      def find_products(vendor_id)
        products_csv = CSV.read("./support/products.csv")
        matches = products_csv.find_all {|product| product[2].to_i == vendor_id}
        # matches is an array
        products_array = []
        matches.each do |line|
          product = FarMar::Product.new({
          :id => line[0].to_i,
          :name => line[1],
          :vendor_id => line[2].to_i
          })
          products_array.push(product)
        end
        #products_array is an array of Vendor objects
        return products_array
      end

      def find_sales(vendor_id)
        sales_csv = CSV.read("./support/sales.csv")
        matches = sales_csv.find_all {|sale| sale[3].to_i == vendor_id}
        # matches is an array
        sales_array = []
        matches.each do |line|
          sale = FarMar::Sale.new({
            :id => line[0].to_i,
            :amount => line[1].to_i,
            :purchase_time => DateTime.parse(line[2]),
            :vendor_id => line[3].to_i,
            :product_id => line[4].to_i
          })
          sales_array.push(sale)
        end
        #sales_array is an array of Sale objects
        return sales_array
      end

      def revenue(vendor_id)
        sales = find_sales(vendor_id)
        #sales is an array of Sale objects
        sum = 0
        sales.each do |sale|
          sum += sale.amount
        end
        return sum
      end

      def self.by_market(market_id)
        all_vendors = FarMar::Vendor.all
        #all_vendors is an array of Vendor objects
        matches = all_vendors.find_all {|vendor| vendor.market_id == market_id}
        return matches
      end

  end
end
