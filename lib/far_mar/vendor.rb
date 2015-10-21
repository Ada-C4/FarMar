module FarMar

  class Vendor

    attr_reader :id, :name, :employees, :market_id

    def initialize(id, name, employees, market_id)
      @id = id.to_i
      @name = name
      @employees = employees.to_i
      @market_id = market_id.to_i
    end

    def self.all
      @@vendors_all ||= []

      if @@vendors_all == []

        vendor_array = CSV.read("./support/vendors.csv")

        vendor_array.map! do |vendor|
          FarMar::Vendor.new(vendor[0],vendor[1],vendor[2],vendor[3])
        end
        @@vendors_all = vendor_array
      end
        return @@vendors_all
    end

    def self.find(id)
      FarMar::Vendor.all.find do |vendor|
        vendor.id == id
      end
    end

    def market
      FarMar::Market.all.find do |market|
        market.id == @market_id
      end
    end

    def products
      products = FarMar::Product.all.find_all do |product|
        product.vendor_id == @id
      end
      return products
    end

    def sales
      sales = FarMar::Sale.all.find_all do |sale|
        sale.vendor_id == @id
      end
    return sales
    end

    def revenue
      sales = self.sales
      revenue = 0
      sales.each do |sale|
        revenue += sale.amount
      end
      return revenue
    end

  end

end
