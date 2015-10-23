# CSV.read('./support/markets.csv')

module FarMar

  class Market
    attr_reader :market_id, :name, :address, :city, :county, :state, :zip

  	def initialize(market_id, name, address, city, county, state, zip)
  		@market_id = market_id.to_i
  		@name = name
  		@address = address
  		@city = city
  		@county = county
  		@state = state
  		@zip = zip
  	end

  	def self.all
      @@market_array ||= []
      if @@market_array == []
  		  CSV.read('./support/markets.csv').each do |row|
          market = FarMar::Market.new(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
          @@market_array.push(market)
        end
      end
      return @@market_array
  	end

    def self.find(id)
      @@market_array.find {|mar| mar.market_id == id }
    end

    def vendors
      FarMar::Vendor.all.find_all {|ven| ven.market == market_id }
    end

    def products
      ven_array = self.vendors
      prod_array = []
      ven_array.each do |ven|
        prod_array.push(ven.products)
        end
      return prod_array.flatten
    end

    def self.search(search_term)
      search_term = search_term.downcase
      match_markets = []
      @@market_array.each do |market|
        match_markets.push(market) if market.name.downcase.match(/#{search_term}/)
      end
      match_vendors = []
      FarMar::Vendor.all.each do |vendor|
        match_vendors.push(vendor) if vendor.name.downcase.match(/#{search_term}/)
       end
       match_vendors.map! {|vendor| vendor.market}
       match_vendors.each do |market_id|
         market = FarMar::Market.find(market_id)
         match_markets.push(market)
       end
       return match_markets
    end

    def preferred_vendor(date = nil)
      if date == nil
        ven = self.vendors
        preferred = ven.max_by{|ven| ven.revenue}
      else 
        date = DateTime.strptime(date, "%Y-%m-%d").to_date
        max_revenue = 0
        pref_vend = nil
        total = 0
        self.vendors.each do |vendor_inst|
          sales_array = []
          vendor_inst.sales.each do |sale_inst|
            if sale_inst.purchase_time.to_date == date
            sales_array.push(sale_inst.amount)
            end
          end
          if sales_array.length > 0
            total = sales_array.inject(0, :+)
            if total > max_revenue
              max_revenue = total
              pref_vend = vendor_inst
            end
          end
        end
        return pref_vend
      end
    end

    def worst_vendor
      ven = self.vendors
      worst = ven.min_by{|ven| ven.revenue}
    end

    def worst_vendor_by_date(date)
      date = DateTime.strptime(date, "%Y-%m-%d").to_date
      min_revenue = Float::INFINITY
      worst_ven = nil
      total = 0
      self.vendors.each do |vendor_inst|
        sales_array = []
        vendor_inst.sales.each do |sale_inst|
          if sale_inst.purchase_time.to_date == date
            sales_array.push(sale_inst.amount)
          end
        end
        if sales_array.length > 0
          total = sales_array.inject(0, :+)
          if total < min_revenue
            min_revenue = total
            worst_ven = vendor_inst
          end
        end
      end
      return worst_ven
    end

  end

end