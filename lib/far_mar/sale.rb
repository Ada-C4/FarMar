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

      def self.all()
        sales_csv = CSV.read("./support/sales.csv")
        sales_array = []
        sales_csv.each do |line|
        new_sale = FarMar::Sale.new(
        {
          :id => line[0].to_i,
          :amount => line[1].to_i,
          :purchase_time => DateTime.parse(line[2]),
          :vendor_id => line[3].to_i,
          :product_id => line[4].to_i
          }
        )
        sales_array.push(new_sale)
      end
      return sales_array
      end

      def self.find(id)
        sales_csv = CSV.read("./support/sales.csv")
        match = sales_csv.find {|sale| sale[0].to_i == id}
        new_sale = FarMar::Sale.new(
        {
          :id => match[0].to_i,
          :amount => match[1].to_i,
          :purchase_time => DateTime.parse(match[2]),
          :vendor_id => match[3].to_i,
          :product_id => match[4].to_i
          }
        )
        return new_sale
      end

      def id
        return @id
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
      end
  end
end
