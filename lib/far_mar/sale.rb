module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = DateTime.parse(purchase_time)
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def vendor
      Vendor.find(@vendor_id)
    end

    def product
      Product.find(@product_id)
    end

    def self.between(beginning_time, end_time)
      beginning_time = DateTime.parse(beginning_time)
      end_time = DateTime.parse(end_time)

      sales_list = self.all

      sales_list.find_all do |instance|
        beginning_time <= instance.purchase_time && instance.purchase_time <= end_time
      end
    end

    def self.all
      @@sales_list ||= []

      if @@sales_list == []
        CSV.foreach("./support/sales.csv") do |row|
          sale = Sale.new(row[0], row[1], row[2], row[3], row[4])
          @@sales_list.push(sale)
        end
      end

      return @@sales_list
    end

    def self.find(id)
      sales_list = self.all

      sales_list.find do |instance|
        instance.id == id
      end
    end
  end
end
