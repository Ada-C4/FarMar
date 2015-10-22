module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
      def initialize(sale_hash)
        @id = sale_hash[:id]
        @amount = sale_hash[:amount]
        @purchase_time = sale_hash[:purchase_time]
        @vendor_id = sale_hash[:vendor_id]
        @product_id = sale_hash[:product_id]
      end

      def self.create_sale_hash(sale_array)
        sale_hash = {}
        sale_hash[:id] = sale_array[0].to_i
        sale_hash[:amount] = sale_array[1].to_i
        sale_hash[:purchase_time] = DateTime.parse(sale_array[2])
        sale_hash[:vendor_id] = sale_array[3].to_i
        sale_hash[:product_id] = sale_array[4].to_i
        return sale_hash
      end

      def self.all()
        @@sales_all ||= []
        if @@sales_all == []
          @@sales_all = CSV.read("./support/sales.csv")
          @@sales_all.map! do |line|
            self.new(self.create_sale_hash(line))
          end
        end
        return @@sales_all
      end

      def self.find(id)
        self.all.find {|sale| sale.id == id}
      end

      def id
        return @id
      end

      def amount
        return @amount
      end

      # def product_id
      #   return @product_id
      # end

      def find_vendor(vendor_id)
        FarMar::Vendor.find(vendor_id)
      end

      def find_product(product_id)
        FarMar::Product.find(product_id)
      end

      def self.between(beginning_time, end_time)
        sales_csv = CSV.read("./support/sales.csv")
        matching_sales_array = []
        sales_csv.find_all do |sale|
          if DateTime.parse(sale[2]) >= beginning_time && DateTime.parse(sale[2]) <= end_time
            new_sale = self.new(self.create_sale_hash(sale))
            matching_sales_array.push(new_sale)
          end
        end
        return matching_sales_array
      end
  end
end
