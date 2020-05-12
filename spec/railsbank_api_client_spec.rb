# frozen_string_literal: true

RSpec.describe RailsbankApiClient do
  let(:api) do
    RailsbankApiClient.configure do |config|
      config.api_key = '1234'
    end
  end

  let(:middleware) do
    api.instance_variable_get('@builder').instance_variable_get('@handlers')
  end

  describe '#build_connection' do
    it 'has the correct middleware' do
      expect(middleware).to include(FaradayMiddleware::EncodeJson)
    end
  end

  describe 'Beneficiary' do
    context '#info' do
      before do
        stub_request(:get, "#{RailsbankApiClient.config.api_url}/v1/customer/beneficiaries/1")
          .to_return(status: 200, body: 'success', headers: {})
      end

      it 'returns the beneficiary\'s info' do
        expect(RailsbankApiClient::Beneficiary.info(1)).to eq 'success'
      end
    end
  end
end
