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
			@@product_array.find {|pro| pro.product_id == id}
		end

		def vendor
			FarMar::Vendor.all.find{|ven| ven.vendor_id == @vendor_id}
		end

		def sales
			FarMar::Sale.all.find_all {|sale| sale.product_id == @product_id}
		end

		def number_of_sales
			self.sales.length
		end

		def self.by_vendor(vendor_id)
			@@product_array.find_all{|prod| prod.vendor_id == vendor_id}
		end

	end

end
