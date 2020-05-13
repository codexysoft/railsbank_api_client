# frozen_string_literal: true

module RailsbankApiClient
  class Beneficiary
    extend ::RailsbankApiClient::RequestHelper

    class << self
      BASE_URL = 'v1/customer/beneficiaries'

      def info(beneficiary_id)
        response = send_get_request("#{BASE_URL}/#{beneficiary_id}")
        response.body
      end

      def wait(beneficiary_id)
        response = send_get_request("#{BASE_URL}/#{beneficiary_id}/wait")
        response.body
      end
    end
  end
end
