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
        products_csv = CSV.read("./support/products.csv")
        products_array = []
        products_csv.each do |line|
        new_product = FarMar::Product.new(self.create_product_hash(line))
        products_array.push(new_product)
      end
      return products_array
      end

      def self.find(id)
        products_csv = CSV.read("./support/products.csv")
        match = products_csv.find {|product| product[0].to_i == id}
        new_product = FarMar::Product.new(self.create_product_hash(match))
        return new_product
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
          sale = FarMar::Sale.new({
            :id => line[0].to_i,
            :amount => line[1].to_i,
            :purchase_time => DateTime.parse(line[2]),
            :vendor_id => line[3].to_i,
            :product_id => line[4].to_i
          })
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
        all_products = FarMar::Product.all
        #all_products is an array of Vendor objects
        matches = all_products.find_all {|product| product.vendor_id == vendor_id}
        return matches
      end
  end
end
