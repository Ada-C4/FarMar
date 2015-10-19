require 'spec_helper'

describe FarMar::Sale do 
	
	describe 'initialize' do 
		before :each do
			sale = FarMar::Sale.new
		end

		it 'can create an instance of a FarMar::Sale' do
			expect(sale).to be_an_instance_of(FarMar::Sale)
		end
  end

  describe 'self.all' do
  	before :each do
  		sale = FarMar::Sale.all
  	end
  	it 'returns an array' do
  		expect(@sale_array).to be_an_instance_of(Array)
  	end
  end

end