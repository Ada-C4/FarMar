require 'csv'
module FarMar
  class Sales
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id, :sales_csv
    def initialize(sales_hash)
      @id = sales_hash[:id].to_i
      @amount = sales_hash[:amont].to_i
      @purchase_time = sales_hash[:purchase_time].time
      @vendor_id = sales_hash[:vendor_id].to_i
      @product_id = sales_hash[:product_id].to_i
      @sales_csv = ("./support/sales.csv")
    end
    def self.all
      @@products_all ||=

        CSV.read("support/sales.csv").map do |row|
          #binding.pry
          FarMar::Product.new({
          id: row[0].to_i,
          name: row[1],
          vendor_id: row[2],
        })
      end
    end

    def self.find(id)
      # all_markets = FarMar::Market.all
      all.find(id) do |sales|
        market.id == id
      end
    end
  end
end



# sale_hash = {
#   id: 311,
#   amount: 1200,
#   purchase_time: 2016-11-09 09:34:56 -0800,
#   vendor_id: 34,
#   product_id: 9118
# }
