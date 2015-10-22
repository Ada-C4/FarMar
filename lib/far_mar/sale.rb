module FarMar
  class Sale

    attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(sale_id, amount, purchase_time, vendor_id, product_id)
      @sale_id = sale_id
      @amount = amount
      @purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id
      @product_id = product_id
    end


    def self.all
      sales_csv = CSV.read("./support/sales.csv")
      sale_instances = []
      sales_csv.each do |row|
        sale_instances.push(Sale.new(row[0].to_i, row[1].to_i, row[2], row[3].to_i, row[4].to_i))
      end
      return sale_instances
    end
    def self.find(id)
        self.all.find do |sale|
        sale.sale_id == id
      end
    end

    def vendor
      sale_vendor_array = FarMar::Vendor.all
      sale_vendor_array.each do |row|
        if row.vendor_id == @vendor_id
          return row
        end
      end
    end

    def product
      sale_product_array = FarMar::Product.all
      sale_product_array.each do |row|
        if row.product_id == @product_id
          return row
        end
      end
    end

    def self.between(beginning_time, end_time)
      sales_by_time = []
      FarMar::Sale.all.find_all do |sale_object|
        sale_object.purchase_time >= beginning_time && sale_object.purchase_time <= end_time
        sales_by_time.push(sale_object)
      end
    end
  end
end
