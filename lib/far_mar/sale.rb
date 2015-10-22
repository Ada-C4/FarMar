module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount
      @purchase_time = purchase_time.to_s
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def self.all
      #returns a collection of sale instances, representing all of the sales described in the CSV
      sale_array = []
      CSV.read("./support/sales.csv").each do |sale|
        list_of_sales = Sale.new(sale[0], sale[1], sale[2], sale[3], sale[4])
        sale_array.push(list_of_sales)
      end
      return sale_array
    end

    def self.find(id)
      sale_array = self.all
      sale_array.find {|i| i.id == id}
    end

    def vendor
      # returns the FarMar::Market instance that is associated with this vendor
      # using the FarMar::Vendor market_id field
      vendor_array = []
      vendor_list = FarMar::Vendor.all
      vendor_list.find_all do |i|
        if i.id == vendor_id
          vendor_array.push(i)
        end
      end
      return vendor_array
    end

    def product
      product_list = FarMar::Product.all
      product_list.find do |product|
        product.id == self.product_id
      end
    end
      # product_array = []
      # sales_list = FarMar::Sale.all
      # sales_list.find_all do |sale|
      #   if sale.product_id == id
      #     product_array.push(i)
      #   end
      # end
      # return product_array

  end
end
