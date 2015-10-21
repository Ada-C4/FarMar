require 'pry'
module FarMar
  class Vendor
     attr_accessor :name, :id, :no_employess, :market_id

    def initialize (id, name, no_employess, market_id)
      @name = name
      @id = id
      @no_employess = no_employess
      @market_id = market_id
    end

    def self.all
      vendor_array =[]
      vendor_csv = CSV.read("./support/vendors.csv")
      vendor_csv.each do |sale|
        new_vendor = Vendor.new(sale[0].to_i, sale[1], sale[2], sale[3].to_i)
        vendor_array.push(new_vendor)
      end
      return vendor_array
    end

    def self.find(id)
      vendor_array = self.all
      vendor_array.find do |vendor|
        vendor.id == id
      end
    end

    def self.market(id)
      vendor_array = self.all
      vendor_array.find_all do |vendor|
        vendor.market_id == id
      end
    end

    def products
      return products_array = FarMar::Product.by_vendor(self.id)
    end

    def sales
      return Farmar::Sale.by_vendor(self.id)
    end


    def revenue
      sale_array = FarMar::Sale.by_vendor(self.id)
      return sale_array.inject(0){|sum, sale| sum + sale.amount}
    end


    #  return sale_array.inject(0) {|sum, sale.amount| sum + sale.amount}
    #end

  end
end
