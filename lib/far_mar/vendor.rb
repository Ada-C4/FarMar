module FarMar

   class Vendor
     attr_reader :id, :name, :employees, :market_id

     def initialize(id = "", name = "", employees = "", market_id = "")
       @id = id
       @name = name
       @employees = employees
       @market_id = market_id
     end

    ######CLASS METHODS####
     def self.all(csv = "./support/vendors.csv")
       vendors_info = CSV.read(csv)
       vendors = []
       vendors_info.each do |a|
         vendors.push(Vendor.new(a[0], a[1], a[2], a[3]))
       end
       return vendors
     end

     #helper method for class methods to search vendors
     def self.find_by(var, search_param, csv = "./support/vendors.csv")
       all = self.all(csv)
       match = (all.find_all {|n| n.send(var) == search_param.to_s})
       return match
     end

     #returns the vendor with the given id.
     def self.find(search_id, csv = "./support/vendors.csv")
       self.find_by(:id, search_id, csv)[0]
     end

     #returns an array of vendors with the given market_id
     def self.by_market(search_market_id, csv = "./support/vendors.csv")
       self.find_by(:market_id, search_market_id, csv)
     end


   #####INSTANCE METHODS######
   #~~~~~search primary keyholder~~~~~~~~~~~#
     #returns the market with an id matching that of a given vendor instance
     def market(market_csv = "./support/markets.csv" )
       all_markets = Market.all(market_csv)
       market_match = (all_markets.find {|n| n.id == self.market_id})
       return market_match
     end

     #~~~~~search foreign keyholders~~~~~~~~~~~#
     # to assist with the .products and .sales methods
     def search_foreign_keyholders(csv, klass)
       search_in = klass.all(csv)
       matches = (search_in.find_all {|n| n.vendor_id == self.id})
       return matches
     end

      #returns an Array of product instances that are associated by the FarMar::Product vendor_id field.
     def products(products_csv = "./support/products.csv")
       search_foreign_keyholders(products_csv, Product)
     end

     #returns an array of FarMar::Sale instances that are associated by the vendor_id field.
     def sales(sales_csv = "./support/sales.csv")
       search_foreign_keyholders(sales_csv, Sale)
     end

     #~~~~~special fun method~~~~~~~~~~~#
     #returns the the sum of all of a vendor instance's sales (in cents)
     def revenue(sales_csv = "./support/sales.csv")
       total = 0
       sales = self.sales(sales_csv)
       sales.each {|n| total += n.amount.to_i}
       return total
     end
   end
end
