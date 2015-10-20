module FarMar
  class Sale

    def self.all
      saless_csv = CSV.read("./support/sales.csv")
      sale_instances = []
      sales_csv.each do |row|
        sale_instances.push(Sale.new(row[0].to_i, row[1].to_i, row[2], row[3].to_i, row[4].to_i))
      end
      return sale_instances
    end
    def self.find(id)
        self.all.find do |sale|
        sale.sale_id == id
      end
    end

  end
end
