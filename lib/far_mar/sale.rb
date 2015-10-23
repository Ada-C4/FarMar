require 'pry'
module FarMar
  class Sale < FarmersMarket
    CSV_FILE = "./support/sales.csv"

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

      if @@sales_list.empty?
        # @@master_hash = Hash.new
        @@sales_by_product = Hash.new {|hash, key| hash[key] = []}
        # revenue_by_product = Hash.new {|hash, key| hash[key] = 0}

        CSV.foreach(CSV_FILE) do |row|
          sale = Sale.new(row[0], row[1], row[2], row[3], row[4])
          @@sales_list.push(sale)

          @@sales_by_product[sale.product_id] << sale
          # create another one of these for products_by_vendor, product.vendor_id in product
          # revenue_by_product[sale.product_id] += sale.amount
        end

      # @@master_hash[:sales_by_product] = sales_by_product
      # @@master_hash[:revenue_by_product] = revenue_by_product
      end

      return @@sales_list
    end

    def self.sales_by_product
      self.all

      return @@sales_by_product
    end

    def self.find(id)
      sales_list = self.all

      sales_list.find do |instance|
        instance.id == id
      end
    end
  end
end
