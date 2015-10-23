module FarMar
  class Vendor < VendorProductBase
    attr_reader :id, :name, :emp_num, :market_id
    FILENAME = './support/vendors.csv'

    def initialize(vendor_hash)
      super(vendor_hash)
      @revenue = revenue
      @num_sales = num_sales
    end

    def self.all_objects
      @@all_objects ||= self.all
    end

    def self.convert_to_hash(array)
      vendor = {}
      vendor[:id] = array[0].to_i
      vendor[:name] = array[1]
      vendor[:emp_num] = array[2].to_i
      vendor[:market_id] = array[3].to_i
      return vendor
    end

    # returns all of the vendors with the given market_id
    def self.by_market(market_id)
      FarMar::Vendor.all_objects.find_all { |vendor| vendor.market_id == market_id }
    end

    # helper method for the most methods
    def self.most_x(n, attribute)
      return [] if
        n.class != Fixnum ||
        n < 0 ||
        n > FarMar::Vendor.all_objects.length
      backwards = FarMar::Vendor.all_objects.sort_by { |vendor_obj| vendor_obj.instance_variable_get(attribute) }
      sorted = backwards.reverse
      return sorted[0, n]
    end

    # returns the top n vendor instances ranked by total number of items sold
    def self.most_revenue(n)
      FarMar::Vendor.most_x(n, "@revenue")
    end

    # returns the top n vendor instances ranked by total number of items sold
    def self.most_items(n)
      FarMar::Vendor.most_x(n, "@num_sales")
    end

    # returns a collection of FarMar::Product instances that are
    # associated by the FarMar::Product vendor_id field
    def products
      return FarMar::Product.by_vendor(@id)
    end

    # returns a collection of FarMar::Sale instances that are
    # associated by the vendor_id
    def sales
      return FarMar::Sale.by_vendor(@id)
    end

    # returns the FarMar::Market instance that is associate with this vendor
    # using the FarMar::Vendor market_id field
    def market
      return FarMar::Market.find(@market_id)
    end

    # returns the sum of all of the vendor's sales (in cents)
    def revenue
      super(:@@vendor_stats)
    end

    def num_sales
      return @num_sales if !@num_sales.nil?
      results = FarMar::Sale.vendor_stats
      if results[@id].nil?
        @num_sales = 0
      else
        @num_sales = results[@id][:num_sales]
      end
    end

    # returns the vendor's revenue for a given date
    def self.revenue(date)
    end

    # returns the total revenue for the specific date and vendor instance
    def day_revenue(date)
      return 0 if date.class != DateTime
      all_sales = FarMar::Sale.by_vendor(@id)
      day_sales = all_sales.select { |sale| sale.purchase_time.to_date == date.to_date }
      return day_sales.inject(0) { |sum, sale_obj| sum + sale_obj.amount }
    end

  end
end
