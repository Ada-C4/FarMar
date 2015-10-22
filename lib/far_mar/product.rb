module FarMar

   class Product
     attr_reader :id, :name, :vendor_id

     def initialize(id = "", name = "", vendor_id = "")
       @id = id
       @name = name
       @vendor_id = vendor_id
     end

    ######CLASS METHODS####
     def self.all(csv = "./support/products.csv")
       products_info = CSV.read(csv)
       products = []
       products_info.each do |a|
         products.push(Product.new(a[0], a[1], a[2]))
       end
       return products
     end

     #helper method for class methods
     def self.find_by(var, search_param, csv = "./support/products.csv")
       all = self.all(csv)
       match = (all.find_all {|n| n.send(var) == search_param.to_s})
       return match
     end

     #returns the product with the given id
     def self.find(search_id, csv = "./support/products.csv")
       self.find_by(:id, search_id, csv)[0]
     end

     #returns an array of products with the given vendor_id
     def self.by_vendor(search_vendor_id, csv = "./support/vendors.csv")
       self.find_by(:vendor_id, search_vendor_id, csv)
     end

  ######INSTANCE METHODS####
     def vendor
     end

     def sales
     end

     def number_of_sales
     end

   end
end
