module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def self.all
      products_list = []
      products_csv = CSV.read("./support/products.csv")

      products_csv.each do |row|
        product = FarMar::Product.new(row[0], row[1], row[2])
        products_list.push(product)
      end

      return products_list
    end

    def self.find(id)
      products_list = self.all

      products_list.find do |instance|
        instance.id == id
      end
    end
  end
end
