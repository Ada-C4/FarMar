require "pry"
require "csv"
module FarMar
  class Sale
    attr_accessor :id, :Amount, :Purchase_time, :vendor_id, :product_id

    def initialize (id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = purchase_time.to_i
      @vnedor_id = vendor_id
      @product_id = product_id.to_i
    end

    def self.all
      sale_array = []
      sale_data = CSV.read("./support/sales.csv")
      sale_data.each do |csv|
        @s = Sale.new(csv[0], csv[1], csv[2], csv[3], csv[4])
        sale_array.push(@s)
      end
      return sale_array
    end

    def self.find(id)
      sale_data = Sale.all
      sale_data.find do |data|
        if data.id == id
          return data
        end
      end
    end
  end
end
