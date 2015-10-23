module FarMar
  class VendorProductBase  < FarMar_Base
    def revenue(attribute)
      return @revenue if !@revenue.nil?
      results = FarMar::Sale.class_variable_get(attribute)
      if results[@id].nil?
        @revenue = 0
      else
        @revenue = results[@id][:revenue]
      end
    end
  end
end
