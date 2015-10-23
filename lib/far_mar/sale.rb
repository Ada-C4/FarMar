module FarMar
  class Sale < FarMar::FarMarParent
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
      def self.filepath
        "./support/sales.csv"
      end

      def self.create_hash(sale_array)
        sale_hash = {}
        sale_hash[:id] = sale_array[0].to_i
        sale_hash[:amount] = sale_array[1].to_i
        sale_hash[:purchase_time] = DateTime.parse(sale_array[2])
        sale_hash[:vendor_id] = sale_array[3].to_i
        sale_hash[:product_id] = sale_array[4].to_i
        return sale_hash
      end

      def amount
        return @amount
      end

      def find_vendor(vendor_id)
        FarMar::Vendor.find(vendor_id)
      end

      def find_product(product_id)
        FarMar::Product.find(product_id)
      end

      def self.between(beginning_time, end_time)
        # add input validation
        matching_sales_array = []
        self.all.find_all do |sale|
          sale.purchase_time >= beginning_time && sale.purchase_time <= end_time
          matching_sales_array.push(sale)
        end
        return matching_sales_array
      end

  end
end
