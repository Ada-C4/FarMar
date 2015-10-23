module FarMar
  class Vendor

    attr_reader :vendor_id, :name, :employees, :market_id

    def initialize(vendor_id, name, employees, market_id)
      @vendor_id = vendor_id
      @name = name
      @employees = employees
      @market_id = market_id
    end

    def self.all
      @@vendor_instances ||= []
      if @@vendor_instances == []
        vendor_csv = CSV.read("./support/vendors.csv")
        vendor_csv.each do |row|
          @@vendor_instances.push(Vendor.new(row[0].to_i, row[1], row[2], row[3].to_i))
        end
      end
      return @@vendor_instances
    end
    def self.find(id)
        self.all.find do |vendor|
        vendor.vendor_id == id
      end
    end

    def market
      vendor_market_array = FarMar::Market.all
      vendor_market_array.each do |row|
        if row.market_id == @market_id
          return row
        end
      end
    end

    def products
      vendor_products_array = []
      product_array = FarMar::Product.all
      product_array.each do |product|
        if product.vendor_id == @vendor_id
          vendor_products_array.push(product)
        end
      end
      return vendor_products_array
    end

    def sales
      vendor_sales_array = []
      sale_array = FarMar::Sale.all
      sale_array.each do |sale|
        if sale.vendor_id == @vendor_id
          vendor_sales_array.push(sale)
        end
      end
      return vendor_sales_array
    end

    def revenue(date = nil)
      date = DateTime.strptime(date, "%Y-%m-%d") if date != nil
      total_revenue = 0
      sales.each do |sale|
        if sale.purchase_time.to_date == date || date == nil
        total_revenue += sale.amount
        end
      end
      return total_revenue
    end

    def self.by_market(market_id)
      market = FarMar::Market.find(market_id)
      return market.vendors
    end
  end
end
