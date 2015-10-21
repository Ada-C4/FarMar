module FarMar
  class Vendor
    attr_reader :id, :market_id

    def initialize(vendor_info)
      @id = vendor_info[0].to_i
      @name = vendor_info[1]
      @number_of_employees = vendor_info[2].to_i
      @market_id = vendor_info[3].to_i
    end

    def self.all
      @@vendor_array ||= []

      if @@vendor_array == []
        CSV.read("./support/vendors.csv").each do |vendor|
          new_vendor = FarMar::Vendor.new(vendor)
          @@vendor_array.push(new_vendor)
        end
      end

      return @@vendor_array
    end

    def self.find(id)
      FarMar::Vendor.all.find do |vendor|
        vendor.id == id
      end
    end

    def market
      FarMar::Market.all.find do |market|
        market.id == self.market_id
      end
    end

    def products
      products = FarMar::Product.all.find_all do |product|
        product.vendor_id == self.id
      end
      return products
    end

    def sales
      sales = FarMar::Sale.all.find_all do |sale|
        sale.vendor_id == self.id
      end
      return sales
    end

    def revenue
      revenue = 0
      sales_array = self.sales
      sales_array.each do |sale|
        revenue = revenue + sale.amount
      end
      return revenue
    end

    def self.by_market(market_id)
      market_vendors = FarMar::Vendor.all.find_all do |vendor|
        vendor.id == market_id
      end
      return market_vendors
    end


  end
end
