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
  	# I don't know if the below spec is too specific or not, 
  	# but I don't know how to generally test the length of a CSV file
  	it 'returns array containing all CSV info' do
      expect(@sale_array.length).to eq(12798)
    end
  end

end