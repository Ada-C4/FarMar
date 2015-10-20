module FarMar
  class FarMar_Base
    def initialize(init_hash)
      # This block sets each key to an instance variable and assigns the value
      init_hash.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def self.all
      csv_file = CSV.read(self::FILENAME)
      # Create empty array which will hold all the objects
      objects = []
      csv_file.each do |row|
        # Convert the array to a hash
        # binding.pry
        csv_hash = self.convert_to_hash(row)
        # Create a product object from each row-hash in the csv file
        temp = self.new(csv_hash)
        # Push product object to array of products
        objects.push(temp)
      end
      return objects
    end

    def self.find(id)
      csv_file = CSV.read(self::FILENAME)
      match_record = csv_file.find { |a| a[0].to_i == id}
      if match_record == nil
        return nil
      else
        hash = self.convert_to_hash(match_record)
        return self.new(hash)
      end
    end

  end
end
