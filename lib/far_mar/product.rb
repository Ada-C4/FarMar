module FarMar

  class Product
     attr_accessor :name , :id, :vendor_id
    def initialize (id, name, vendor_id)
      @name = name
      @id = id
      @vendor_id = vendor_id
    end
  end
end
