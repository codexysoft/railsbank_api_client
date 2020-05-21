# frozen_string_literal: true

module RailsbankApiClient
  class Customer
    extend ::RailsbankApiClient::RequestHelper

    class << self
      BASE_URL = 'v1/customer'

      def me
        response = send_get_request("#{BASE_URL}/me")
        response.body
      end

      def partners
        response = send_get_request("#{BASE_URL}/my/partners")
        response.body
      end
    end
  end
end
