module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      #returns a collection of sale instances, representing all of the sales described in the CSV
      sale_array = []
      CSV.read("./support/sales.csv").each do |sale|
        print sale
        list_of_sales = Sale.new(sale[0], sale[1], sale[2], sale[3], sale[4])
        sale_array.push(list_of_sales)
      end
    end
  end
end
