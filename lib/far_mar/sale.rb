module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      CSV.read("support/sales.csv").map do |line|
        FarMar::Sale.new(line[0].to_i, line[1].to_i, line[2], line[3].to_i, line[4].to_i)
      end
    end

    def self.find(id)
      match = CSV.open("support/markets.csv").find { |n| n[0].to_i == id}
      return FarMar::Sale.new(match[0].to_i, match[1].to_i, match[2].to_s, match[3].to_i, match[4].to_i)
    end
  end
end
