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

  ######CLASS METHODS####
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

  ######INSTANCE METHODS####
  #~~~~~search primary keyholders~~~~~~~~~~~#
  #returns the vendor with an id matching that of a given product instance
      #helper method to search multiple primary keyholders
     def search_primary_keyholders(csv, klass)
       search_in = klass.all(csv)
       match = (search_in.find {|n| n.id == self.id})
       return match
     end

     #returns the vendor with an id matching that of a given sale instance
     def vendor(vendor_csv = "./support/vendors.csv")
       search_primary_keyholders(vendor_csv, Vendor)
     end

     #returns the product with an id matching that of a given sale instance
     def product(product_csv = "./support/products.csv")
       search_primary_keyholders(product_csv, Product)
     end
   end
end
