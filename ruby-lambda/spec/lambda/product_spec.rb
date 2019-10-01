require 'json'
require './app/functions/product_handler'

RSpec.describe Lambda::ProductHandler do
	subject { Lambda::ProductHandler }

	context '#edit' do
		let!(:payload) { File.new('./spec/support/fixtures/lambda/product/put.json').read }
		let!(:context) { {} }
		let!(:event) {
			{
				'headers': {
					'Accept': 'application/json'
				},
				'body': payload
			}
		}

		let(:response) { subject.edit(event: event, context: context) }

		it 'Modify product' do
			product = response[:body][:product]
			payload_parse = JSON.parse(payload, symbolize_names: true)
			expect(response).to include(statusCode: 200)
			expect(response[:body]).to include(status: 'ok')
			expect(product[:name]).to include(payload_parse[:product][:name])
		end
	end
end

