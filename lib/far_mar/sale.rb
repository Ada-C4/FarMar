module FarMar

   class Sale
     attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

     def initialize(id = "", amount = "", purchase_time = "", vendor_id = "", product_id = "")
       @id = id
       @amount = amount
       @purchase_time = purchase_time
       @vendor_id = vendor_id
       @product_id = product_id
     end


    #  @open_date = DateTime.strptime(open_date, "%Y-%m-%d %H:%M:%S %z")
    #     end

    def self.all(csv = "./support/sales.csv")
      sales_info = CSV.read(csv)
      sales = []
      sales_info.each do |a|
        sales.push(Sale.new(a[0], a[1], a[2], a[3], a[4]))
      end
      return sales
    end

    def self.find(search_id, csv = "./support/sales.csv")
      all = self.all(csv)
      match = (all.find {|n| n.id == search_id.to_s})
      return match
    end

     def self.between(beginning_time, end_time)
     end

     def vendor
     end

     def product
     end


   end

end
