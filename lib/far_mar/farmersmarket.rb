module FarMar
  class FarmersMarket
    class << self

      ["id", "name", "address", "city", "county", "state", "zip"].each do |attribute|
	      define_method("find_by_#{attribute}") do |argument|
          list = self.all
			    case attribute
          when "id"
            list.find { |instance| instance.method(attribute).call == argument if instance.respond_to?(attribute)}
          when "name", "city"
            list.find { |instance| instance.method(attribute).call.include?(argument) if instance.respond_to?(attribute)}
          end
        end
  	  end

    end
  end
end
