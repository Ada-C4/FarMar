require "csv"

module FarMar
  class FarMarParent
    def initialize(init_hash)
      # This block sets each key to an instance variable and assigns the value
      init_hash.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def self.all()
      if !instance_variable_defined?("@all")
        instance_variable_set("@all", CSV.read(self.filepath))
        @all.map! do |line|
          self.new(self.create_hash(line))
        end
      end
      return @all
    end


    def self.find(id)
      self.all.find {|object| object.id == id}
    end

    def id
      return @id
    end

  end
end
