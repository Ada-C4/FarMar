require 'spec_helper'

describe FarMar::Sale do 
	
	describe '#initialize' do 
    before :each do
      @sale = FarMar::Sale.new(5,4440,"2013-11-10 05:19:05 -0800",1,1)
    end
		it 'can create an instance of a FarMar::Sale' do
			expect(@sale).to be_an_instance_of(FarMar::Sale)
		end
  end

  describe '.all' do
    before :each do
      @sale_array = FarMar::Sale.all
    end
  	it 'returns an array' do
  		expect(@sale_array).to be_an_instance_of(Array)
  	end
    it 'contains all sales from CSV' do 
      csv = CSV.read("support/sales.csv")
      expect(@sale_array.length).to eq csv.length

    end
  end

  describe  '.find' do
    it 'returns a matching sale instance' do
      expect(FarMar::Sale.find(15).amount).to eq(8924)
    end
  end

  describe '#vendor' do
    it 'returns Vendor that is associated with Sale' do
      sale = FarMar::Sale.new(14,4978,"2013-11-10 01:51:24 -0800",3,4)
      expect(sale.vendor.name).to eq("Breitenberg Inc")
    end
  end

  describe 'product' do
    it 'returns Product associated with the Sale' do
      sale = FarMar::Sale.new(14,4978,"2013-11-10 01:51:24 -0800",3,4)
      expect(sale.product.name).to eq("Yummy Fruit")
    end
  end

  describe 'self.between(beginning_time, end_time)' do
    before :each do
      @beg_time1 = DateTime.strptime("2013-11-06 08:35:40 -08:00", "%Y-%m-%d %H:%M:%S %z")
      @end_time1 = DateTime.strptime("2013-11-13 08:35:16 -0800", "%Y-%m-%d %H:%M:%S %z")
    end
    it 'returns Sales between two purchase times' do
      sales = FarMar::Sale.between(@beg_time1, @end_time1)
      expect(sales.length).to eq(12798)
    end
  end

end