
module FarMar
  class Vendor
    attr_reader :id, :name, :market_id

    def initialize(id, name, num_employees, market_id)
      @id = id
      @name = name
      @num_employees = num_employees
      @market_id = market_id
    end

    def self.all
      @@all_vendors ||= []

      if @@all_vendors == []
        CSV.read("./support/vendors.csv").each do |line|
          y = FarMar::Vendor.new(line[0].to_i, line[1], line[2].to_i, line[3].to_i)
          @@all_vendors.push(y)
        end
      end

      return @@all_vendors
    end

    def self.find(id)
      FarMar::Vendor.all.find do |vendor_instance|
        vendor_instance.id == id
      end
    end

    def market
      FarMar::Market.all.find do |market_instance|
        market_instance.id == @market_id
      end
    end

    def products
      FarMar::Product.all.find_all do |product_instance|
        product_instance.vendor_id == @id
      end
    end

    def sales
      FarMar::Sale.all.find_all do |sales_instance|
        sales_instance.vendor_id == @id
      end
    end

    def revenue
      revenue = 0

      sales.each do |sales_instance|
        revenue += sales_instance.amount
      end

      return revenue
    end

    def self.by_market(market_id)
      FarMar::Vendor.all.find_all do |vendor_instance|
        vendor_instance.market_id == market_id
      end
    end

    def self.most_revenue(n)
      vendors_by_revenue = []

      all.each do |vendor|
        vendors_by_revenue.push(vendor)
      end

      vendors_by_revenue = vendors_by_revenue.sort_by { |vendor| vendor.revenue }

      return vendors_by_revenue[0...n]
    end

    def self.most_items(n)
      vendors_by_items = self.all

      vendors_by_items = vendors_by_items.sort_by { |vendor| vendor.products.length }

      return vendors_by_items[0...n]

    end

    def self.revenue(date)
      date = DateTime.strptime(date, "%Y-%m-%d").to_date
      revenue = 0

      self.all.each do |vendor_instance|
        vendor_instance.sales.each do |sales_instance|
          if sales_instance.purchase_time.to_date == date
            revenue += sales_instance.amount
          end
        end
      end

      return revenue

    end
  end
end
