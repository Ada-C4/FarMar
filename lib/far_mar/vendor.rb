module FarMar
  class Vendor < FarMar::FarMarParent
    attr_accessor :id, :name, :num_employees, :market_id
      def self.filepath
        "./support/vendors.csv"
      end

      def self.create_hash(vendor_array)
        vendor_hash = {}
        vendor_hash[:id] = vendor_array[0].to_i
        vendor_hash[:name] = vendor_array[1]
        vendor_hash[:num_employees] = vendor_array[2].to_i
        vendor_hash[:market_id] = vendor_array[3].to_i
        return vendor_hash
      end

      def market_id
        return @market_id
      end

      def name
        return @name
      end

      def find_market(market_id)
        return FarMar::Market.find(market_id)
      end

      def find_products(vendor_id)
        products_array = []
        FarMar::Product.all.each do |product|
          if vendor_id == product.vendor_id
            products_array.push(product)
          end
        end
          return products_array
      end

      def find_sales(vendor_id)
        sales_array = []
        FarMar::Sale.all.each do |sale|
          if vendor_id == sale.vendor_id
            sales_array.push(sale)
          end
        end
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
        all_vendors = self.all
        #all_vendors is an array of Vendor objects
        matches = all_vendors.find_all {|vendor| vendor.market_id == market_id}
        return matches
      end

  end
end
