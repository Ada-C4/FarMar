require 'pry'

module FarMar
  class Vendor
    attr_accessor :id, :name, :no_employees, :market_id

    def initialize(id, name, no_employees, market_id)
      @id = id.to_i
      @name = name
      @no_employees = no_employees.to_i
      @market_id = market_id.to_i
    end

    def market
      Market.find(@market_id)
    end

    def products
      products_list = Product.all

      return products_list.find_all do |instance|
        @id == instance.vendor_id
      end
    end

    def sales
      sales_list = Sale.all

      return sales_list.find_all do |instance|
        @id == instance.vendor_id
      end
    end

    def revenue
      @revenue ||= 0

      if @revenue == 0
        @revenue = self.sales.inject(0) { |sum, sale| sum + sale.amount }
      end

      return @revenue
    end

    def self.by_market(market_id)
      vendors_list = self.all

      return vendors_list.find_all do |vendor|
        market_id == vendor.market_id
      end
    end

    def self.all
      @@vendors_list ||= []

      if @@vendors_list == []
        CSV.foreach("./support/vendors.csv") do |row|
          vendor = Vendor.new(row[0], row[1], row[2], row[3])
          @@vendors_list.push(vendor)
        end
      end

      return @@vendors_list
    end

    def self.find(id)
      vendors_list = self.all

      vendors_list.find do |instance|
        instance.id == id
      end
    end

    def self.most_revenue(n)
      vendors_list = self.all

      vendors_list.max_by(n) do |vendor|
        vendor.revenue
      end
    end

    def self.most_items(n)
      vendors_list = self.all

      vendors_list.max_by(n) do |vendor|
        vendor.products.length
      end
    end

    def self.revenue(date)
      sales_list = Sale.between(date, date)

      sales_list.inject(0) { |sum, sale| sum + sale.amount}
    end

    def daily_sales(date)
      sales_list = Sale.between(date, date)

      vendor_sales = sales_list.find_all do |sale|
        sale.vendor_id == self.id
      end

      vendor_sales.inject(0) { |sum, sale| sum + sale.amount}
    end

  end
end
