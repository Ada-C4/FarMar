require './lib/far_mar'
module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end
    def self.all
      @@sales_all ||= []
      if @@sales_all == []
        CSV.read("./support/sales.csv").map do |row|
          @@sales_all.push(FarMar::Sale.new(row[0], row[1], row[2], row[3], row[4]))
        end
      end
        return @@sales_all
    end
    def self.find(id)
      FarMar::Sale.all.find do |sale|
        sale.id == id
      end
    end
  end
end
