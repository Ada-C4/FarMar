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

  #~~~~~search primary keyholder~~~~~~~~~~~#
  #returns the vendor with an id matching that of a given product instance
     def vendor(vendor_csv = "./support/vendors.csv")
       all_vendors = Vendor.all(vendor_csv)
       vendor_match = (all_vendors.find {|n| n.id == self.vendor_id})
       return vendor_match
     end

    #~~~~~search foreign keyholder~~~~~~~~~~~#
    #returns an array of sales with the given product id
     def sales(sales_csv = "./support/sales.csv")
        all_sales = Sale.all(sales_csv)
        matches = (all_sales.find_all {|n| n.product_id == self.id})
        return matches
     end

     #~~~~~special fun method~~~~~~~~~~~#
     #returns the number of times a product has been sold
     def number_of_sales(sales_csv = "./support/sales.csv" )
       self.sales(sales_csv).length 
     end
  end
end
