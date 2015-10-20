module FarMar

   class Market
     attr_reader :id, :name, :address, :city, :county, :state, :zip

     @@market_objects_array = []

     def initialize(id = "", name = "", address = "", city = "", county = "", state = "", zip = "")
       @id = id
       @name = name
       @address = address
       @city = city
       @county = county
       @state = state
       @zip = zip
     end

    #method for inputting csv file to generate markets
    #market_csv is the path to a csv file
     def self.all(market_csv)
       market_info = CSV.read(market_csv)
       market_info.each do |a|
         Market.new(a[0], a[1], a[2], a[3], a[4], a[5], a[6])
       end
     end

     def self.find(id)
      #  returns instance where the value matches the parameter
     end

     def vendors
     end


   end

end
