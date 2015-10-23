module FarMar
  class VendorProductBase  < FarMar_Base

    # helper method for the most methods in product and vendor classes
    def self.most_x(n, attribute)
      return [] if
        n.class != Fixnum ||
        n < 0 ||
        n > FarMar::Vendor.all_objects.length
      backwards = FarMar::Vendor.all_objects.sort_by { |vendor_obj| vendor_obj.instance_variable_get(attribute) }
      sorted = backwards.reverse
      return sorted[0, n]
    end

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
