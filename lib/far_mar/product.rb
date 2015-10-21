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

     def self.find(search_id, csv = "./support/products.csv")
       all = self.all(csv)
       match = (all.find {|n| n.id == search_id.to_s})
       return match
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
