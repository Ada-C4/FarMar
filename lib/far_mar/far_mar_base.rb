module FarMar
  class FarMar_Base
    def initialize(init_hash)
      # This block sets each key to an instance variable and assigns the value
      init_hash.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def self.all
      if !self.class_variable_defined?(:@@all_objects)
        csv_file = CSV.read(self::FILENAME)
        # Create empty array which will hold all the objects
        objects = []
        csv_file.each do |row|
          # Convert the array to a hash
          csv_hash = self.convert_to_hash(row)
          # Create a product object from each row-hash in the csv file
          temp = self.new(csv_hash)
          # Push product object to array of products
          objects.push(temp)
        end
        self.class_variable_set(:@@all_objects, objects)
      end
      self.all_objects
    end

    def self.find(id)
      self.all_objects.find { |obj| obj.id == id }
    end

  end
end
