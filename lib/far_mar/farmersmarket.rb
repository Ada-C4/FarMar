module FarMar
  class FarmersMarket
    class << self

      ATTRIBUTES = ["id", "name", "address", "city", "county", "state", "zip", "vendor_id", "sale", "amount", "purchase_time", "product_id", "no_employees", "market_id"]

      ATTRIBUTES.each do |attribute|
	      define_method("find_by_#{attribute}") do |argument|
          list = self.all
          raise NoMethodError unless ATTRIBUTES.include?(attribute)

			    case attribute
          when "id", "vendor_id", "sale", "amount", "product_id"
            list.find { |instance| instance.method(attribute).call == argument if instance.respond_to?(attribute)}
          when "name", "city", "address", "city", "county", "state", "zip"
            list.find { |instance| instance.method(attribute).call.include?(argument) if instance.respond_to?(attribute)}
          when "purchase_time"
            list.find { |instance| instance.method(attribute).call.to_date == Date.parse(argument) if instance.respond_to?(attribute)}
          end
        end
  	  end

      ATTRIBUTES.each do |attribute|
	      define_method("find_all_by_#{attribute}") do |argument|
          list = self.all
			    case attribute
          when "id", "vendor_id", "sale", "amount", "product_id"
            list.find_all { |instance| instance.method(attribute).call == argument if instance.respond_to?(attribute)}
          when "name", "city", "address", "city", "county", "state", "zip"
            list.find_all { |instance| instance.method(attribute).call.include?(argument) if instance.respond_to?(attribute)}
          when "purchase_time"
            list.find_all { |instance| instance.method(attribute).call.to_date == Date.parse(argument) if instance.respond_to?(attribute)}
          end
        end
  	  end

    end
  end
end
