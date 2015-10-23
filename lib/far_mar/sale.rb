module FarMar

  class Sale

    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = DateTime.parse(purchase_time)
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def self.all
      @@sales_all ||= []

      if @@sales_all == []

        sale_array = CSV.read("./support/sales.csv")

        sale_array.map! do |sale|
          FarMar::Sale.new(sale[0],sale[1],sale[2],sale[3],sale[4])
        end
        @@sales_all = sale_array
      end
      return @@sales_all
    end

    def self.find(id)
      FarMar::Sale.all.find do |sale|
        sale.id == id
      end
    end

    def vendor
      FarMar::Vendor.all.find do |vendor|
        vendor.id == @vendor_id
      end
    end

    def product
      FarMar::Product.all.find do |product|
        product.id == @product_id
      end
    end

    def self.between(beginning_time, end_time)
      beginning_time = DateTime.parse(beginning_time)
      end_time = DateTime.parse(end_time)
      FarMar::Sale.all.find_all do |sale|
        sale.purchase_time >= beginning_time && sale.purchase_time <= end_time
      end
    end
  end


end
