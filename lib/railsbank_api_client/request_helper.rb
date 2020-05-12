# frozen_string_literal: true

require 'faraday'

module RailsbankApiClient
  module RequestHelper
    def send_request(parameter, base_url)
      RailsbankApiClient.api.get("#{generate_url(base_url)}/#{parameter}", {})
    end

    private

    def generate_url(base_url)
      "#{RailsbankApiClient.config.api_url}/#{base_url}"
    end
  end
end
