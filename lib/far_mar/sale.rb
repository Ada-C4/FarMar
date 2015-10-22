module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(sale_hash)
      @id = sale_hash[:id].to_i
      @amount = sale_hash[:amount].to_i
      @purchase_time = DateTime.parse(sale_hash[:purchase_time])
      @vendor_id = sale_hash[:vendor_id].to_i
      @product_id = sale_hash[:product_id].to_i
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

    def vendor
      associated_vendor = FarMar::Vendor.all.find_all do |each|
        @vendor_id == each.id
      end
      return associated_vendor
    end

    def product
      associated_product = FarMar::Product.all.find_all do |each|
        @product_id == each.id
      end
      return associated_product
    end

    def self.between(beginning_time, end_time)
      #beginning_time = DateTime.parse(beginning_time)
      #end_time = DateTime.parse(end_time)
      all_between = []
      self.all do |each|
        all_between.push(each) if each.purchase_time >= beginning_time && each.purchase_time <= end_time
      end
    end
  end
end
