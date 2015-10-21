require 'pry'
module FarMar

  class Sale
     attr_accessor :amount , :id, :purchase_time, :vendor_id , :product_id
    def initialize (id, amount, purchase_time, vendor_id, product_id)
      @amount = amount
      @id = id
      @purchase_time =  DateTime.parse(purchase_time)#DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id
      @product_id = product_id

    end

    def self.all
      sale_array =[]
      sale_csv = CSV.read("./support/sales.csv")
      sale_csv.each do |sale|
        new_sale = Sale.new(sale[0].to_i, sale[1].to_i, sale[2], sale[3].to_i, sale[4].to_i)
        sale_array.push(new_sale)
      end
      return sale_array
    end

    def self.find(id)
      sale_array = self.all
      sale_array.find do |sale|
        sale.id == id
      end
    end

  end
end
