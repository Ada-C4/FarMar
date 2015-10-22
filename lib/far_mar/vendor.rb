module FarMar
  class Vendor
    attr_reader :id, :market_id, :name

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

    def self.most_revenue(n)
      sorted_vendors = FarMar::Vendor.all.sort_by do |vendor|
        vendor.revenue
      end
      sorted_vendors.reverse!
      return sorted_vendors[0..n-1]
    end

    def self.most_items(n)
      sorted_vendors = FarMar::Vendor.all.sort_by do |vendor|
        vendor.products.length
      end
      sorted_vendors.reverse!
      return sorted_vendors[0..n-1]
    end

    def self.revenue_by_date(date)
      date = Date.parse(date.to_s)
      total_revenue = 0
      FarMar::Sale.all.each do |sale|
        if sale.purchase_time.to_date == date
          total_revenue = total_revenue + sale.amount
        end
      end
      return total_revenue
    end

    def vendor_revenue_by_date(date)
      date = Date.parse(date.to_s)
      day_sales = self.sales.find_all do |sale|
        date == sale.purchase_time.to_date
      end
      day_revenue = 0
      day_sales.each do |sale|
        day_revenue = day_revenue + sale.amount
      end
      return day_revenue
    end

  end
end
