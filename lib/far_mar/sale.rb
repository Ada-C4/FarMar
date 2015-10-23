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
      match = all.find {|n| n.id == search_id.to_s}
      return match
    end

    #~~~~~special fun method~~~~~~~~~~~#
   def self.between(beginning_time, end_time, csv = "./support/sales.csv")

     #returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
     range = beginning_time..end_time
     all = self.all(csv) #array of all sales
     in_range = all.find_all {|n| range.cover?(n.purchase_time)}
     return in_range
   end

  ######INSTANCE METHODS####
  #~~~~~search primary keyholders~~~~~~~~~~~#
  #returns the vendor with an id matching that of a given product instance
      #helper method to search multiple primary keyholders
   def search_primary_keyholders(var, klass, csv)
     search_in = klass.all(csv)
     match = (search_in.find {|n| n.id == self.send(var)})
     return match
   end

   #returns the vendor with an id matching that of a given sale instance
   def vendor(vendor_csv = "./support/vendors.csv")
     search_primary_keyholders(:vendor_id, Vendor, vendor_csv)
   end

   #returns the product with an id matching that of a given sale instance
   def product(product_csv = "./support/products.csv")
     search_primary_keyholders(:product_id, Product, product_csv)
   end
 end
end
