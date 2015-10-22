module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id
      def initialize(product_hash)
        @id = product_hash[:id]
        @name = product_hash[:name]
        @vendor_id = product_hash[:vendor_id]
      end

      def self.create_product_hash(product_array)
        product_hash = {}
        product_hash[:id] = product_array[0].to_i
        product_hash[:name] = product_array[1]
        product_hash[:vendor_id] = product_array[2].to_i
        return product_hash
      end

      def self.all()
        @@products_all ||= []
        if @@products_all == []
          @@products_all = CSV.read("./support/products.csv")
          @@products_all.map! do |line|
            self.new(self.create_product_hash(line))
          end
        end
        return @@products_all
      end

      def self.find(id)
        self.all.find {|product| product.id == id}
      end

      def id
        return @id
      end

      def vendor_id
        return @vendor_id
      end

      def find_vendor(vendor_id)
        FarMar::Vendor.find(vendor_id)
      end

      def find_sales(product_id)
        sales_csv = CSV.read("./support/sales.csv")
        matches = sales_csv.find_all {|sale| sale[4].to_i == product_id}
        # matches is an array
        sales_array = []
        matches.each do |line|
          sale = FarMar::Sale.new(FarMar::Sale.create_sale_hash(line))
          sales_array.push(sale)
        end
        #sales_array is an array of Vendor objects
        return sales_array
      end

      def number_of_sales(product_id)
        sales = find_sales(product_id)
        total = 0
        sales.each {|sale| total += 1}
        return total
      end

      def self.by_vendor(vendor_id)
        all_products = self.all
        #all_products is an array of Vendor objects
        matches = all_products.find_all {|product| product.vendor_id == vendor_id}
        return matches
      end
  end
end
