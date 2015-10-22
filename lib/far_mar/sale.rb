module FarMar
  class Sale < FarMar_Base
    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
    FILENAME = './support/sales.csv'

    def initialize(sale_hash)
      super(sale_hash)
      # FarMar::Vendor.all_objects[@vendor_id].revenue += @amount
    end

    def self.all_objects
      @@all_objects ||= self.all[0]
    end

    def self.vendor_stats
      @@vendor_stats ||= self.all[1]
    end

    def self.all
      if !self.class_variable_defined?(:@@all_objects) ||!self.class_variable_defined?(:@@vendor_stats)
        csv_file = CSV.read(FILENAME)
        # Create empty array which will hold all the objects
        objects = []
        stats = {}
        csv_file.each do |row|
          # Convert the array to a hash
          sale_hash = convert_to_hash(row)
          # Create an object from each row-hash in the csv file
          temp = self.new(sale_hash)
          # Push object to array of products
          objects.push(temp)
          # Populate the stats array
          if stats[sale_hash[:vendor_id]].nil? # if there is no revenue yet
            stats[sale_hash[:vendor_id]] = {}
            stats[sale_hash[:vendor_id]][:revenue] = sale_hash[:amount] # store the first revenue
            stats[sale_hash[:vendor_id]][:num_sales] = 1 # and tally 1 for number of sales
          else
            stats[sale_hash[:vendor_id]][:revenue] += sale_hash[:amount] # add the amount to the revenue
            stats[sale_hash[:vendor_id]][:num_sales] += 1 # and add 1 to sale tally
          end
        end
        return self.class_variable_set(:@@all_objects, objects), self.class_variable_set(:@@vendor_stats, stats)

      end
      self.all_objects
    end

    def self.convert_to_hash(sale_array)
      sale_hash = {}
      sale_hash[:id] = sale_array[0].to_i
      sale_hash[:amount] = sale_array[1].to_i
      sale_hash[:purchase_time] = DateTime.parse(sale_array[2])
      sale_hash[:vendor_id] = sale_array[3].to_i
      sale_hash[:product_id] = sale_array[4].to_i
      return sale_hash
    end

    # returns all of the sales with the given product id
    def self.by_product(product_id)
      return FarMar::Sale.all_objects.find_all { |sale| sale.product_id == product_id }
    end

    # returns all of the vendors with the given vendor id
    def self.by_vendor(vendor_id)
      return FarMar::Sale.all_objects.find_all { |sale| sale.vendor_id == vendor_id }
    end

    # returns a collection of FarMar::Sale objects where the purchase time
    # is between the two times given as arguments
    def self.between(beginning_time, end_time)
      return [] if
        beginning_time.class != DateTime ||
        end_time.class != DateTime ||
        end_time <= beginning_time
      return FarMar::Sale.all_objects.find_all { |sale_obj| sale_obj.purchase_time > beginning_time && sale_obj.purchase_time < end_time }
    end

    # returns the Vendor that is associated with the sale
    def vendor
      return FarMar::Vendor.find(@vendor_id)
    end

    # returns the Product that is associated with the sale
    def product
      return FarMar::Product.find(@product_id)
    end
  end
end
