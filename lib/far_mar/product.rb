# CSV.read("./support/products.csv")

module FarMar

	class Product
		attr_reader :product_id, :name, :vendor_id

		def initialize(product_id, name, vendor_id)
			@product_id = product_id
			@name = name.to_s
			@vendor_id = vendor_id
		end

		def self.all
			product_array = []
			CSV.read('./support/products.csv').each do |row|
        product = FarMar::Product.new(row[0], row[1], row[2])
        product_array.push(product)
			end
			return product_array
		end

	end

end
