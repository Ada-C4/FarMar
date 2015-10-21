# CSV.read("./support/products.csv")

module FarMar

	class Product
		attr_reader :product_id, :name, :vendor_id

		def initialize(product_id, name, vendor_id)
			@product_id = product_id.to_i
			@name = name.to_s
			@vendor_id = vendor_id.to_i
		end

		def self.all
			@@product_array ||= []
			if @@product_array == []
				CSV.read('./support/products.csv').each do |row|
        	product = FarMar::Product.new(row[0], row[1], row[2])
        	@@product_array.push(product)
				end
			end
			return @@product_array
		end

		def self.find(id)
			FarMar::Product.all.find {|pro| pro.product_id == id}
		end

	end

end
