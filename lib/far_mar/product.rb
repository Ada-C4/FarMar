require 'csv'
module FarMar
  class Product
    attr_reader :id, :name, :vendor_id, :products_csv
    def initialize(product_hash)
      @id = product_hash[:id].to_i
      @name = product_hash[:name]
      @vendor_id = product_hash[:vendor_id].to_i
      @products_csv = ("./support/products.csv")
    end

    def self.all
      @@product_all ||=

        CSV.read("support/products.csv").map do |row|
          #binding.pry
          FarMar::Product.new({
          id: row[0].to_i,
          name: row[1],
          vendor_id: row[2],
        })
      end
    end

    def self.find(id)
      # all_markets = FarMar::Market.all
      all.find do |product|
        product.id == id
      end
    end
  end
end







# product_hash={
#   id: 121
#   name: "marigolds"
#   vendor_id: 45
# }
