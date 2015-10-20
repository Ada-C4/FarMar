module FarMar

   class Market
     attr_reader :ID, :name, :address, :city, :county, :state, :zip
     #the choice- to iterate or to read and manipulate?
     #what datatype do I ultimately want? Probably a hash.
    #  CSV.open(filename, mode='r', options) {|file| block}
    #
    # CSV.open("moar_ada_peeps.csv", 'w') do |csv|
    #   csv << "5,Charles"
    # end
    #
    #
    # CSV.open("markets.csv", 'r').each do |line|
    #   puts line
    # end


     def initialize
     end



     def self.all
      #  returns market_instances_array, which should be an array of objects
     end

     def self.find(id)
      #  returns instance where the value matches the parameter
     end

     def vendors
     end


   end

end
