require "csv"

module FarMar
  class Sale

    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    # Returns a collection of sale instances
    # representing all of the sales described in the CSV
    def self.all
      csv_info = CSV.read("./support/sales.csv")
      sales = []
      csv_info.each do |line|
        sales.push(Sale.new(line[0], line[1], line[2], line[3], line[4]))
      end
      return sales
      ## for optimization, say, if @sales has stuff in it, don't run it again, just return it.
    end

    # Returns an instance of sale where the value of the id in Sale
    # matches the passed parameter.
    def self.find(sale_id)
      all.each do |sales|
        if sales.id == sale_id
          return sales # the instance of the sale.
        end
      end
    end

    # Returns the instance of the vendor associated with the Sale vendor_id
    def vendor
      FarMar::Vendor.all.each do |v|
        if v.id == vendor_id
          return v
        end
      end
    end

    # Returns the one product ID associated with this sale using the product_id
    def product
      FarMar::Product.all.each do |prod|
        if prod.id == product_id
          return prod
        end
      end
    end

    # Returns an array of sale objects where the purchase time is between the
    # two times given as arguments.
    def self.between(beginning_time, end_time)
      sales_array = []
      self.all.find_all do |sales|
        if sales.purchase_time >= beginning_time && sales.purchase_time <= end_time
          sales_array.push(sales)
        end
      end
      return sales_array
    end

  end
end
