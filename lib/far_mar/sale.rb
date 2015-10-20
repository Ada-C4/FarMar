# CSV.read("./support/sales.csv")

module FarMar

	class Sale
		attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id

		def initialize(sale_id, amount, purchase_time, vendor_id, product_id)
			@sale_id = sale_id
			@amount = amount
			purchase_time = purchase_time.to_s
			@purchase_time = DateTime.strptime(purchase_time, "%Y-%m-%d %H:%M:%S %z")
			@vendor_id = vendor_id
			@product_id = product_id
		end

		def self.all
			sales_array = []
			CSV.read('./support/sales.csv').each do |row|
        sale = FarMar::Sale.new(row[0], row[1], row[2], row[3], row[4])
        sales_array.push(sale)
      end
			return sales_array
		end

	end

end