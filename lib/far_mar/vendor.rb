module FarMar

   class Vendor
     attr_reader :id, :name, :employees, :market_id

     def initialize(id = "", name = "", employees = "", market_id = "")
       @id = id
       @name = name
       @employees = employees
       @market_id = market_id
     end

     def self.all(csv = "./support/vendors.csv")
       vendors_info = CSV.read(csv)
       vendors = []
       vendors_info.each do |a|
         vendors.push(Vendor.new(a[0], a[1], a[2], a[3]))
       end
       return vendors
     end

     def self.find(search_id, csv = "./support/vendors.csv")
       all = self.all(csv)
       match = (all.find {|n| n.id == search_id.to_s})
       return match
     end

     def self.by_market(market_id)
     end

     #returns the market with an id matching that of a given vendor instance
     def market(market_csv = "./support/markets.csv" )
       all_markets = Market.all(market_csv)
       market_match = (all_markets.find {|n| n.id == self.market_id})
       return market_match
     end


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

     def revenue
     end

   end

end
