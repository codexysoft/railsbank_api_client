# frozen_string_literal: true

module RailsbankApiClient
  class Connection
    HEADERS = {
      'X-Accept' => 'application/json'
    }.freeze

    def self.build(config)
      Faraday.new(url: config.api_url) do |connection|
        connection.options[:timeout] = 120
        connection.request :json
        connection.headers = HEADERS.merge({ 'Authorization' => config.api_key })
        connection.adapter Faraday.default_adapter
      end
    end
  end
end
