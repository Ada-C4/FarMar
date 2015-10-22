# CSV.read("./support/sales.csv")

module FarMar

	class Sale
		attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id

		def initialize(sale_id, amount, purchase_time, vendor_id, product_id)
			@sale_id = sale_id.to_i
			@amount = amount.to_i
			purchase_time = purchase_time.to_s
			@purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
			@vendor_id = vendor_id.to_i
			@product_id = product_id.to_i
		end

		def self.all
				@@sales_array ||= []
				if @@sales_array = []
				CSV.read('./support/sales.csv').each do |row|
        	sale = FarMar::Sale.new(row[0], row[1], row[2], row[3], row[4])
        	@@sales_array.push(sale)
      	end
      end
			return @@sales_array
		end

		def self.find(id)
			@@sales_array.find {|sale| sale.sale_id == id}
		end

		def vendor
			FarMar::Vendor.all.find {|ven| ven.vendor_id == @vendor_id}
		end

		def product
			FarMar::Product.all.find {|pro| pro.product_id == @product_id}
		end

		def self.between(beginning_time, ending_time)
			@@sales_array.find_all do |sale|
				sale.purchase_time.between?(beginning_time, ending_time)
			end
		end

	end

end