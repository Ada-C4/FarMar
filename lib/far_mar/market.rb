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
    #market_csv is the path to a csv file, and the default is the markets.csv
     def self.all(csv = "./support/markets.csv")
       market_info = CSV.read(csv)
       markets = []
       market_info.each do |a|
         markets.push(Market.new(a[0], a[1], a[2], a[3], a[4], a[5], a[6]))
       end
       return markets
     end

     #method to return an instance for which the id matches the parameter
     #input a csv and an id. By default, the market.csv will be used, but this method can be reused in other classes and given different default csv values.

     def self.find(search_id, csv = "./support/markets.csv")
       all = self.all(csv)
       match = (all.find {|n| n.id == search_id.to_s})
       return match
     end

     def vendors

     end


   end

end
