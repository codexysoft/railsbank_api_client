RSpec.describe RailsbankApiClient::Enduser do
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

  context '#info' do
    before do
      stub_request(:get, "#{RailsbankApiClient.config.api_url}/v1/customer/endusers/1")
          .to_return(status: 200, body: 'success', headers: {})
    end

    it 'returns the enduser\'s info' do
      expect(RailsbankApiClient::Enduser.info(1)).to eq 'success'
    end
  end

  context '#wait' do
    before do
      stub_request(:get, "#{RailsbankApiClient.config.api_url}/v1/customer/endusers/1/wait")
          .to_return(status: 200, body: 'success', headers: {})
    end

    it 'returns the enduser\'s info' do
      expect(RailsbankApiClient::Enduser.wait(1)).to eq 'success'
    end
  end

  describe 'POST #create' do
    subject do
      stub_request(:post, "#{RailsbankApiClient.config.api_url}/v1/customer/endusers")
        .with(body: params)
        .to_return(status: status, body: response, headers: {})
    end

    context 'with valid params' do
      before { subject }

      let(:params) { { person: { name: 'Name', date_of_birth: '01-01-1970', date_onboarded: '01-01-2000' } } }
      let(:status) { 200 }
      let(:response) do
        { "enduser_id" => "enduser_id" }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create(params)).to eq response
      end
    end

    context 'with empty params' do
      before { subject }

      let(:params) { {} }
      let(:status) { 400 }
      let(:response) do
        { "error" => "can-not-distinguish-person-and-company",
          "msg"   => "Exactly one of the fields 'person' and 'company' must be present"
        }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create({})).to eq response
      end
    end

    context "with  absent 'company.name' param" do
      before { subject }

      let(:params) { { company: {} } }
      let(:status) { 400 }
      let(:response) do
        {
          "error"  => "field-is-required",
          "detail" => "Field is required",
          "path"   => ["company","name"],
          "type"   => "body"
        }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create(params)).to eq response
      end
    end

    context "with  invalid 'company.date_onboarded' param" do
      before { subject }

      let(:params) { { company: { date_onboarded: 'wrong-date-type' } } }
      let(:status) { 400 }
      let(:response) do
        {
          "error"  => "field-is-malformed",
          "detail" => "Field is malformed",
          "path"   => ["company","date_onboarded"],
          "type"   => "body"
        }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create(params)).to eq response
      end
    end

    context "with invalid 'company.type' param" do
      before { subject }

      let(:params) { { company: { type: 'wrong-type' } } }
      let(:status) { 400 }
      let(:response) do
        {
          "error"  => "field-is-malformed",
          "detail" => "Field is malformed",
          "path"   => ["company","type"],
          "type"   => "body"
        }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create(params)).to eq response
      end
    end

    context "with  absent 'person.name' param" do
      before { subject }

      let(:params) { { person: {} } }
      let(:status) { 400 }
      let(:response) do
        {
          "error"  => "field-is-required",
          "detail" => "Field is required",
          "path"   => ["person","name"],
          "type"   => "body"
        }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create(params)).to eq response
      end
    end

    context "with  invalid 'person.date_of_birth' param" do
      before { subject }

      let(:params) { { person: { date_of_birth: "wrong-date-type" } } }
      let(:status) { 400 }
      let(:response) do
        {
          "error"  => "field-is-malformed",
          "detail" => "Field is malformed",
          "path"   => ["person", "date_of_birth"],
          "type"   => "body"
        }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create(params)).to eq response
      end
    end

    context "with  invalid 'person.date_onboarded' param" do
      before { subject }

      let(:params) { { person: { date_onboarded: "wrong-date-type" } } }
      let(:status) { 400 }
      let(:response) do
        {
          "error"  => "field-is-malformed",
          "detail" => "Field is malformed",
          "path"   => ["person", "date_onboarded"],
          "type"   => "body"
        }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create(params)).to eq response
      end
    end

    context "with  invalid 'person.pep_type' param" do
      before { subject }

      let(:params) { { person: { pep_type: "wrong-pep-type" } } }
      let(:status) { 400 }
      let(:response) do
        {
          "error"  => "field-is-malformed",
          "detail" => "Field is malformed",
          "path"   => ["person", "pep_type"],
          "type"   => "body"
        }.to_json
      end

      it 'returns error messages' do
        expect(RailsbankApiClient::Enduser.create(params)).to eq response
      end
    end
  end
end
