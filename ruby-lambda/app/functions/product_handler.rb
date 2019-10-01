# frozen_string_literal: true
require 'json'
require 'securerandom'
require './app/models/product'

# Handler for endpoints relationated with product's class
module Lambda
	class ProductHandler
		def self.edit(event:, context:)
			params = JSON.parse(event[:body], symbolize_names: true)
			product_params = params[:product]
			product = Product.new
			product.name = product_params.dig(:name)
			product.sku = product_params.dig(:sku)
			product.price = product_params.dig(:price)
			product.id = SecureRandom.uuid
			{
				statusCode: 200,
				body: {
					status: 'ok',
					product: product.serialize
				}
			}
		end
	end
end

