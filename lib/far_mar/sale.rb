require 'pry'
module FarMar

  class Sale
     attr_accessor :amount , :id, :purchase_time, :vendor_id , :product_id
    def initialize (id, amount, purchase_time, vendor_id, product_id)
      @amount = amount
      @id = id
      @purchase_time =  DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z" )
      @vendor_id = vendor_id
      @product_id = product_id
      # @sale_array = self.all  -check it later

    end

    def self.all
      @@sale_all ||= []
      if @@sale_all == []
        sale_csv = CSV.read("./support/sales.csv")
        sale_csv.each do |sale|
          new_sale = Sale.new(sale[0].to_i, sale[1].to_i, sale[2], sale[3].to_i, sale[4].to_i)
          @@sale_all.push(new_sale)
        end
      end
      return @@sale_all
    end

    def self.find(id)
      @@sale_all = self.all
      @@sale_all.find do |sale|
        sale.id == id
      end
    end

    def self.by_vendor(id)
      @@sale_all = self.all
      @@sale_all.find_all do |sale|
        sale.vendor_id == id
      end
    end

    def self.between(beginnig_time, end_time)
      @@sale_all = self.all
      array_sales = []
      @@sale_all.map do |sale|
        check = sale.purchase_time.between?(beginnig_time, end_time)
        array_sales.push(sale) if check
      end
      return array_sales
    end
  end
end
