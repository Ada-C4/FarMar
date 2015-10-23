module FarMar
	class LookUp
		
		def revenue
			revenue_array = []

			sales.each do |sale|
				revenue = sale.amount
				revenue_array << revenue
			end

			return revenue_array.inject(0) {|result, element| result + element}
		end

		class << self

			def find(id)
				self.all.find do |line|
					line.identifier.to_i == id
				end
			end

			attributes = [
				"identifier", "name", "address", "city", 
				"county", "state", "zip", "no_employees",
				"vendor_id", "purchase_time", "product_id",
				"market_id", "amount"
			]

			attributes.each do |attribute|
		  	define_method("find_by_#{attribute}") do |argument|
			    case attribute
			    when "identifier", "amount", "vendor_id", "market_id", "product_id", "purchase_time"
			      self.all.find do |market|
			      	if market.respond_to?(attribute)
				      	market.method(attribute).call == argument
			      	end
			      end
			    when "name", "city", "address", "county", "state", "zip", "no_employees"
			      self.all.find do |market| 
			      	if market.respond_to?(attribute)
				      	market.method(attribute).call.match(/#{Regexp.escape(argument)}/i)
			    		end
			    	end
			    end
		  	end
		  end

			attributes.each do |attribute|
		  	define_method("find_all_by_#{attribute}") do |argument|
			    case attribute
			    when "identifier", "amount", "vendor_id", "market_id", "product_id", "purchase_time"
			      self.all.find_all do |market| 
			      	if market.respond_to?(attribute)
			      		market.method(attribute).call == argument 
			      	end
			      end
			    when "name", "city", "address", "county", "state", "zip", "no_employees"
			      self.all.find_all do |market| 
			      	if market.respond_to?(attribute)
			      		market.method(attribute).call.match(/#{Regexp.escape(argument)}/i)
			    		end
			    	end
			    end

		  	end
		  end
		end
	
	end
end