module FarMar
  class Sale
    attr_reader :id, :vendor_id, :product_id, :amount, :purchase_time

    def initialize(sale_info)
      @id = sale_info[0].to_i
      @amount = sale_info[1].to_i
      @purchase_time = DateTime.strptime(sale_info[2], "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = sale_info[3].to_i
      @product_id = sale_info[4].to_i
    end

    def self.all
      return sales_by_product.values.flatten
    end

    def self.sales_by_product
      @@sales_by_product ||= Hash.new { |hash,key| hash[key] = [] }

      if @@sales_by_product.empty?
        CSV.read("./support/sales.csv").each do |sale|
          new_sale = FarMar::Sale.new(sale)
          @@sales_by_product[new_sale.product_id].push(new_sale)
        end
      end
      return @@sales_by_product
    end

    def self.sales_by_vendor
      @@sales_by_vendor ||= Hash.new { |hash,key| hash[key] = [] }

      if @@sales_by_vendor.empty?
        CSV.read("./support/sales.csv").each do |sale|
          new_sale = FarMar::Sale.new(sale)
          @@sales_by_vendor[new_sale.vendor_id].push(new_sale)
        end
      end
      return @@sales_by_vendor
    end

    def self.find(id)
      FarMar::Sale.all.find do |sale|
        sale.id == id
      end
    end

    def vendor
      FarMar::Vendor.all.find do |vendor|
        vendor.id == self.vendor_id
      end
    end

    def product
      FarMar::Product.all.find do |product|
        product.id == self.product_id
      end
    end

    def self.between(beginning_time, end_time)
      if beginning_time.class == String
        beginning_time = DateTime.strptime(beginning_time, "%Y-%m-%d %H:%M:%S %z")
      end
      if end_time.class == String
        end_time = DateTime.strptime(end_time, "%Y-%m-%d %H:%M:%S %z")
      end
      sales_between = FarMar::Sale.all.find_all do |sale|
        sale.purchase_time.between?(beginning_time,end_time)
      end
      return sales_between
    end

  end
end
