# frozen_string_literal: true
require 'securerandom'

# Model for basic product
class Product
	attr_accessor :id, :name, :sku, :price

	def initialize
		@id = SecureRandom.uuid
		@name = 'Default'
		@sku = '00000000000'
		@price = 0
	end

	def serialize
		{
			id: @id,
			name: @name,
			sku: @sku,
			price: @price
		}
	end
end

