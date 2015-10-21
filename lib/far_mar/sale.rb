module FarMar
  class Sale

    attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(sale_id, amount, purchase_time, vendor_id, product_id)
      @sale_id = sale_id
      @amount = amount
      @purchase_time = purchase_time
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

  end
end
