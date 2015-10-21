module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount
      @purchase_time = purchase_time.to_s
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      #returns a collection of sale instances, representing all of the sales described in the CSV
      sale_array = []
      CSV.read("./support/sales.csv").each do |sale|
        list_of_sales = Sale.new(sale[0], sale[1], sale[2], sale[3], sale[4])
        sale_array.push(list_of_sales)
      end
      return sale_array
    end

    def self.find(id)
      sale_array = self.all
      sale_array.find {|i| i.id == id}
    end
  end
end
