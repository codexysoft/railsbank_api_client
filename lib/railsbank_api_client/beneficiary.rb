# frozen_string_literal: true

module RailsbankApiClient
  class Beneficiary
    extend ::RailsbankApiClient::RequestHelper

    class << self
      BASE_URL = 'v1/customer/beneficiaries'

      def info(beneficiary_id)
        response = send_request(beneficiary_id, BASE_URL)
        response.body
      end
    end
  end
end
