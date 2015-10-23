require 'pry'
module FarMar
  class Product < FarmersMarket
    attr_accessor :id, :name, :vendor_id, :sale
    CSV_FILE = "./support/products.csv"

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def vendor
      Vendor.find(@vendor_id)
    end

    def sales
      Sale.sales_by_product[@id]

      # return sales_list.find_all do |instance|
      #   @id == instance.product_id
      # end
    end

    def number_of_sales
      self.sales.length
    end

    def self.by_vendor(vendor_id)
      products_list = self.all

      return products_list.find_all do |product|
        vendor_id == product.vendor_id
      end
    end

    def self.all
      @@products_list ||= []

      if @@products_list.empty?
        @@products_by_vendor = Hash.new {|hash, key| hash[key] = []}
        CSV.foreach(CSV_FILE) do |row|
          product = Product.new(row[0], row[1], row[2])
          @@products_list.push(product)

          # create another one of these for products_by_vendor, product.vendor_id in product
          # binding.pry
          @@products_by_vendor[product.vendor_id] << product
          # binding.pry
        end
      end

      return @@products_list
    end

    def self.products_by_vendor
      self.all

      return @@products_by_vendor
    end

    def self.find(id)
      products_list = self.all

      products_list.find do |instance|
        instance.id == id
      end
    end

    def self.most_revenue(n)
      # max_n = Sale.all[1][:revenue_by_product].keys.max_by(n) do |key|
      #   Sale.all[1][:revenue_by_product][key]
      # end
      #
      # max_n.map! { |id| self.find(id) }
      products_list = self.all

      products_list.max_by(n) do |product|
        product.sales.inject(0) { |sum, sale| sum + sale.amount }
      end
    end

  end
end
