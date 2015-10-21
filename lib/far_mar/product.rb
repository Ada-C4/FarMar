module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id
      def initialize(product_hash)
        @id = product_hash[:id]
        @name = product_hash[:name]
        @vendor_id = product_hash[:vendor_id]
      end

      def self.all()
        products_csv = CSV.read("./support/products.csv")
        products_array = []
        products_csv.each do |line|
        new_product = FarMar::Product.new(
        {
          :id => line[0].to_i,
          :name => line[1],
          :vendor_id => line[2].to_i
          }
        )
        products_array.push(new_product)
      end
      return products_array
      end

      def self.find(id)
        products_csv = CSV.read("./support/products.csv")
        match = products_csv.find {|product| product[0].to_i == id}
        new_product = FarMar::Product.new(
        {
          :id => match[0].to_i,
          :name => match[1],
          :vendor_id => match[2].to_i
          }
        )
        return new_product
      end

      def id
        return @id
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
            :purchase_time => line[2],
            :vendor_id => line[3].to_i,
            :product_id => line[4].to_i
          })
          sales_array.push(sale)
        end
        #sales_array is an array of Vendor objects
        return sales_array
      end
  end
end
