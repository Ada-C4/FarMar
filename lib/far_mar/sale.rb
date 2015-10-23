module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = purchase_time.to_s
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
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
      #self.find(id) - returns an instance of Sale where the value of the id field
      #in the CSV matches the passed parameter.
      all.find {|i| i.id == id}
    end

    def vendor
      # returns the FarMar::Market instance that is associated with this vendor
      # using the FarMar::Vendor market_id field
      vendor_list = FarMar::Vendor.all
      vendor_list.find do |vendor|
        vendor.id == vendor_id
      end
    end

    def product
      #product - returns the FarMar::Product
      # instance that is associated with this sale using the FarMar::Sale product_id field
      product_list = FarMar::Product.all
      product_list.find do |product|
        product.id == product_id
      end
    end


    def self.between(beginning_time, end_time)
      #returns a collection of FarMar::Sale
      #objects where the purchase time is between the two times given as arguments
      sales_between_times_array = []
      list_of_sales = FarMar::Sale.all
      list_of_sales.find_all do |sale|
        if (beginning_time < sale.purchase_time) && (sale.purchase_time < end_time)
          sales_between_times_array.push(sale)
        end
      end
      return sales_between_times_array
    end
#       @begin = DateTime.strptime("2013-11-06 08:35:40 -0800", "%Y-%m-%d %H:%M:%S %z")
# @end = DateTime.strptime("2013-11-13 08:35:16 -0800", "%Y-%m-%d
#
#       list_of_sales.each do |sale_object|
#         sale_object.purchase_time > beginning_time && sale_object.purchase_time < end_time


  end
end
