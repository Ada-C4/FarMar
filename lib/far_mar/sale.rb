module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def self.all
      sales_list = []
      sales_csv = CSV.read("./support/sales.csv")

      sales_csv.each do |row|
        sale = FarMar::Sale.new(row[0], row[1], row[2], row[3], row[4])
        sales_list.push(sale)
      end

      return sales_list
    end

    def self.find(id)
      sales_list = self.all

      sales_list.find do |instance|
        instance.id == id
      end
    end
  end
end
