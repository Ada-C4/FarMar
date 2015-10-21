require 'csv'
require 'pry'

module FarMar
  class Sale

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      @sales = []
      CSV.foreach('./support/sales.csv') do |row|
        newsales = Sale.new row[0].to_i, row[1].to_s, DateTime.parse(row [2]), row[3].to_i, row[4].to_i
        @sales.push(newsales)
      end
      return @sales
    end

    def self.find(id)
      return Sale.all.find do |sale|
          sale.id == id
      end
    end
  end
end
