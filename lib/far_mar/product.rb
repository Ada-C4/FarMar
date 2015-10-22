module FarMar

   class Product
     attr_reader :id, :name, :vendor_id

     def initialize(id = "", name = "", vendor_id = "")
       @id = id
       @name = name
       @vendor_id = vendor_id
     end

     def self.all(csv = "./support/products.csv")
       products_info = CSV.read(csv)
       products = []
       products_info.each do |a|
         products.push(Product.new(a[0], a[1], a[2]))
       end
       return products
     end

     def self.find_by(var, search_param, csv = "./support/products.csv")
       all = self.all(csv)
       match = (all.find {|n| n.send(var) == search_param.to_s})
       return match
     end

     #returns an array of products with the given id
     def self.find(search_id, csv = "./support/products.csv")
       self.find_by(:id, search_id, csv)
     end

     #returns an array of products with the given market_id
     def self.by_market(search_market_id, csv = "./support/vendors.csv")
       self.find_by(:market_id, search_market_id, csv)
     end


     def self.by_vendor(vendor_id)
     end

     def vendor
     end

     def sales
     end

     def number_of_sales
     end

   end
end
