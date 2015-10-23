module FarMar
  module VendorProductBase
    # info from http://www.railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/
    def self.included(base)
      # extend is for adding class methods
      base.extend(ClassMethods)
    end

    module ClassMethods
      # these are class methods for the VendorProductBase module
      # written this way so that "self" refers to the class that is calling it
      # self is either FarMar::Vendor or FarMar::Product
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
