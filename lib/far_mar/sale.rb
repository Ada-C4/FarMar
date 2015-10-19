# CSV.read("./support/sales.csv")

module FarMar

	class Sale
		attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id

		def initialize(sale_id, amount, purchase_time, vendor_id, product_id)
			@sale_id = sale_id
			@amount = amount
			@purchase_time = purchase_time
			@vendor_id = vendor_id
			@product_id = product_id
		end

	end

end