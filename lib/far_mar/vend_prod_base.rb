module FarMar
  module VendorProductBase

    def self.included(base)
      base.extend(ClassMethods)
    end

    # helper method for the most methods in product and vendor classes
    module ClassMethods
      def most_x(n, attribute)
        return [] if
          n.class != Fixnum ||
          n < 0 ||
          n > self.all_objects.length
        backwards = self.all_objects.sort_by { |obj| obj.instance_variable_get(attribute) }
        sorted = backwards.reverse
        return sorted[0, n]
      end
    end

    def revenue
      return @revenue if !@revenue.nil?
      results = FarMar::Sale.class_variable_get(self.class::REV_ATTR)
      if results[@id].nil?
        @revenue = 0
      else
        @revenue = results[@id][:revenue]
      end
    end
  end
end
