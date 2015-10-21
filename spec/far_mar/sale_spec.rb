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
      expect(FarMar::Sale.find(15).product_id).to be eq(4)
    end
  end

end