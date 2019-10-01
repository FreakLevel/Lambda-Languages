require './app/models/product.rb'

RSpec.describe Product do
	it 'create a product class' do
		product = Product.new
		expect(product).to be_kind_of(Product)
	end

	it 'create a product with name' do
		name = 'Cookie'
		product = Product.new
		product.name = name
		expect(product).to be_kind_of(Product)
		expect(product.name).to eql(name)
	end
end

