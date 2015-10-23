module FarMar
	class Sale < LookUp

		attr_accessor :identifier, :amount, :purchase_time, :vendor_id, :product_id

		def initialize(sales_hash)
			@identifier = 	 sales_hash[:identifier]
			@amount = 			 sales_hash[:amount]
			@purchase_time = DateTime.parse(sales_hash[:purchase_time])
			@vendor_id = 		 sales_hash[:vendor_id]
			@product_id = 	 sales_hash[:product_id]
		end

		def self.all
			return sales_by_product.values.flatten
		end

		def self.sales_by_product
			@@sales_by_product ||= Hash.new {|hash, key| hash[key] = []}

			if @@sales_by_product.empty? 
				CSV.read("support/sales.csv").each do |row|
					sale_hash = {:identifier => row[0].to_i, :amount => row[1].to_i, 
											 :purchase_time => row[2], :vendor_id => row[3].to_i, 
											 :product_id => row[4].to_i
											}
					@@sales_by_product[row[4].to_i].push(Sale.new(sale_hash))
				end
			end

			return @@sales_by_product
		end

		def self.sales_by_vendor
			@@sales_by_vendor ||= Hash.new {|hash, key| hash[key] = []}

			if @@sales_by_vendor.empty? 
				CSV.read("support/sales.csv").each do |row|
					sale_hash = {:identifier => row[0].to_i, :amount => row[1].to_i, 
											 :purchase_time => row[2], :vendor_id => row[3].to_i, 
											 :product_id => row[4].to_i
											}
					@@sales_by_vendor[row[3].to_i].push(Sale.new(sale_hash))
				end
			end

			return @@sales_by_vendor
		end

		def vendor
			FarMar::Vendor.all.find { |vendor| vendor.identifier == @vendor_id }
		end

		def product
			FarMar::Product.all.find { |product| product.identifier == @product_id }
		end

		def self.between(begin_time, end_time)
			begin_time = DateTime.parse(begin_time)
      end_time = DateTime.parse(end_time)

      self.all.find_all do |instance|
				(instance.purchase_time > begin_time) && (instance.purchase_time < end_time)
			end
		end
	end
end