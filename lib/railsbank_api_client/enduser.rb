# frozen_string_literal: true

module RailsbankApiClient
  class Enduser
    extend ::RailsbankApiClient::RequestHelper

    class << self
      BASE_URL = 'v1/customer/endusers'

      def info(enduser_id)
        response = send_get_request("#{BASE_URL}/#{enduser_id}")
        response.body
      end

      def wait(enduser_id)
        response = send_get_request("#{BASE_URL}/#{enduser_id}/wait")
        response.body
      end

      def create(params)
        response = send_post_request("#{BASE_URL}", params)
        response.body
      end
    end
  end
end
