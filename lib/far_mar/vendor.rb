module FarMar
  class Vendor
    attr_reader :id, :name, :employees, :market_id

    def initialize(vendor_hash)
      @id = vendor_hash[:id].to_i
      @name = vendor_hash[:name]
      @employees = vendor_hash[:employees].to_i
      @market_id = vendor_hash[:market_id].to_i
    end

    def self.all
      @@all_vendors ||= CSV.read('./support/vendors.csv').map do |col|
         FarMar::Vendor.new({
           id: col[0],
           name: col[1],
           employees: col[2],
           market_id: col[3]
         })
       end
    end

    def self.find(id)
      all.find{|vendor| vendor.id == id}
    end

    def market
      #returns the FarMar::Market instance that is associated
      #with this vendor using the FarMar::Vendor market_id field
      FarMar::Market.all.find do |market|
        @market_id == market.id
      end
    end

    def products
      FarMar::Product.all.find_all do |product|
        product.vendor_id == @id
      end
    end

    def sales
      FarMar::Sale.all.find_all do |sale|
        sale.vendor_id == @id
      end
    end

    # def revenue
    #   total_revenue = 0
    #   sales.each do |sale|
    #     total_revenue += sale.amount
    #   end
    #   return total_revenue
    # end

    def revenue
        sales.reduce(0) {|sum, sale| sum + sale.amount}
    end

    def self.by_market(market_id)
      #returns all of the vendors with the given market id
      all.find_all{|vendor| vendor.market_id == market_id}
    end
  end
end
