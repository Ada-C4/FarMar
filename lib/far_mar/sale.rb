require 'csv'

module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id, :sales_csv
    def initialize(sale_hash)
      @id = sale_hash[:id].to_i
      @amount = sale_hash[:amont].to_i
      @purchase_time = sale_hash[:purchase_time]
      @vendor_id = sale_hash[:vendor_id].to_i
      @product_id = sale_hash[:product_id].to_i
      @sales_csv = ("./support/sales.csv")
    end

    def self.all
      @@sale_all ||=

        CSV.read("./support/sales.csv").map do |row|
          #binding.pry
          FarMar::Sale.new({
          id: row[0].to_i,
          amount: row[1],
          purchase_time: row[2],
          vendor_id: row[3],
          product_id: row[4],
        })
      end
    end

    def self.find(id)
      # all_markets = FarMar::Market.all
      all.find do |sale|
        sale.id == id
      end
    end
  end
end
