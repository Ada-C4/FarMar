
module FarMar
  class Sale
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      all_sales = []

      CSV.read("./support/sales.csv").each do |line|
        y = FarMar::Sale.new(line[0].to_i, line[1].to_i, line[2], line[3].to_i, line[4].to_i)
        all_sales.push(y)
      end

      return all_sales
    end

    def self.find(id)
    end
  end
end
