require "pry"
require "csv"
module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize (id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id.to_i
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
    def get_vendor
      FarMar::Vendor.all.find_all do |vendor|
        vendor.id == @vendor_id
      end
    end

    def get_product
      FarMar::Product.all.each do |product|
        if product.id == product_id
          return product
        end
      end
    end

  def self.between(beginning_time, end_time)
    array = []
    self.all.find_all do |sale_times|
      if sale_times.purchase_time >= beginning_time && sale_times.purchase_time <= end_time
      array.push(sale_times)
      end
    end
    return array
  end
  end
end
