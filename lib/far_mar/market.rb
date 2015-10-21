module FarMar

   class Market
     attr_reader :id, :name, :address, :city, :county, :state, :zip

     def initialize(id = "", name = "", address = "", city = "", county = "", state = "", zip = "")
       @id = id
       @name = name
       @address = address
       @city = city
       @county = county
       @state = state
       @zip = zip
     end

    #method for inputting csv file to reutrn an array of market instances
    #market_csv is the path to a csv file.
     def self.all(market_csv)
       market_info = CSV.read(market_csv)
       markets = []
       market_info.each do |a|
         markets.push(Market.new(a[0], a[1], a[2], a[3], a[4], a[5], a[6]))
       end
       return markets
     end

     #method to return a market instance for which the id matches the parameter
     #input a csv and an id
     def self.find(market_csv, search_id)
       all = self.all(market_csv)
       match = (all.find {|n| n.id == search_id.to_s})
       return match
     end

     def vendors
     end


   end

end
