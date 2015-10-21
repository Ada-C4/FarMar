
module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :amount, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id
      @product_id = product_id      
    end

    def self.all
      @@all_sales ||= []

        if @@all_sales == []
          CSV.read("./support/sales.csv").each do |line|
            y = FarMar::Sale.new(line[0].to_i, line[1].to_i, line[2], line[3].to_i, line[4].to_i)
            @@all_sales.push(y)
          end
        end

      return @@all_sales
    end

    def self.find(id)
      FarMar::Sale.all.find do |sale_instance|
        sale_instance.id == id
      end
    end

    def self.between(beginning_time, end_time)
      beginning_time = DateTime.strptime(beginning_time, "%Y-%m-%d %H:%M:%S %z")
      end_time = DateTime.strptime(end_time, "%Y-%m-%d %H:%M:%S %z")

      FarMar::Sale.all.find_all do |sales_instance|
        sales_instance.purchase_time >= beginning_time && sales_instance.purchase_time <= end_time
      end
    end

    def vendor
      FarMar::Vendor.all.find do |vendor_instance|
        vendor_instance.id == @vendor_id
      end
    end

    def product
      FarMar::Product.all.find do |product_instance|
        product_instance.id == @product_id
      end
    end
  end
end
