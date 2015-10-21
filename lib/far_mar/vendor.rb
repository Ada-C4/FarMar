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

     def market
     end

     def products
     end

     def sales
     end

     def revenue
     end

   end

end
