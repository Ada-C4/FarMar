module FarMar

  class Sale

    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = DateTime.parse(purchase_time)
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def self.all
      sale_array = CSV.read("./support/sales.csv")

      sale_array.map! do |sale|
        FarMar::Sale.new(sale[0],sale[1],sale[2],sale[3],sale[4])
      end
        return sale_array
    end

    def self.find(id)
      FarMar::Sale.all.find do |sale|
        sale.id == id
      end
    end

  end

end
