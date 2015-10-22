module FarMar
  class Vendor < FarMar_Base
    attr_reader :id, :name, :emp_num, :market_id, :revenue
    FILENAME = './support/vendors.csv'

    def initialize(vendor_hash)
      super(vendor_hash)
      @revenue ||= revenue
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

    # returns the top n vendor instances ranked by total number of items sold
    def self.most_revenue(n)
      return [] if
        n.class != Fixnum ||
        n < 0 ||
        n > FarMar::Vendor.all_objects.length
      sorted = FarMar::Vendor.all_objects.sort_by { |v| v.revenue }
      return sorted[-n, n].reverse
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
      sales_array = sales
      sales_array.inject(0) { |sum, sale_obj| sum + sale_obj.amount }
    end

  end
end
