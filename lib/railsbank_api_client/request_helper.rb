# frozen_string_literal: true

require 'faraday'

module RailsbankApiClient
  module RequestHelper
    def send_get_request(url)
      RailsbankApiClient.api.get("#{api_url}/#{url}")
    end

    def send_post_request(url, body)
      RailsbankApiClient.api.post("#{api_url}/#{url}", body)
    end

    private

    def api_url
      RailsbankApiClient.config.api_url
    end
  end
end
