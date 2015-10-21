module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(sale_hash)
      @id = sale_hash[:id]
      @amount = sale_hash[:amount]
      @purchase_time = sale_hash[:purchase_time]
      @vendor_id = sale_hash[:vendor_id]
      @product_id = sale_hash[:product_id]
    end

    def self.all
      sales = []
      sales_array = CSV.read("support/sales.csv")
      sales_array.each do |line|
      new_sale = Sale.new(
        id: line[0],
        amount: line[1],
        purchase_time: line[2],
        vendor_id: line[3],
        product_id: line[4])
        sales.push(new_sale)
      end
      return sales
    end

    def self.find(id)
      sales_array = CSV.read("support/sales.csv")
      matched_line = sales_array.find do |line|
        line[0].to_i == id
      end
        Sale.new(
        id: matched_line[0],
        amount: matched_line[1],
        purchase_time: matched_line[2],
        vendor_id: matched_line[3],
        product_id: matched_line[4])
    end
  end
end
