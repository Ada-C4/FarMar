require "csv"

module FarMar
  class Sale

    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(id, name, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @name = name
      @purchase_time = purchase_time
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def self.all
      # returns a collection of sale instances
      # representing all of the sales described in the CSV
      csv_info = CSV.read("./support/sales.csv")
      @sales = []
      csv_info.each do |line|
        @sales.push(Sale.new(line[0], line[1], line[2], line[3], line[4]))
      end
      return @sales
      ## for optimization, say, if @sales has stuff in it, don't run it again, just return it. 
    end

    def self.find(sale_id)
      # Returns an instance of sale where the value of the id in the csv
      # matches the passed parameter.
      all.each do |sales|
        if sales.id == sale_id
          return sales # the instance of the sale.
        end
      end
    end

    def vendor(vendor_id)
      # Returns an instance that is associated with this sale using the vendor_id
    end

    def product(product_id)
      # Returns the product instance that is associated with this sale using the product_id
    end

    def self.between(beginning_time, end_time)
      # Returns an array of sale objects where the purchase time is between the
      # two times given as arguments.
    end
  end
end
