module FarMar
  class FarmersMarket
    class << self

      # some way to dynamically call a method
      # obj.public_send(method_name) if obj.respond_to? method_name

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
