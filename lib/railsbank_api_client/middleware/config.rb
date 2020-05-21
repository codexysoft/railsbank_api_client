# frozen_string_literal: true

module RailsbankApiClient
  module Middleware
    class Config < Hashie::Mash
      DEFAULTS = {
        base_url: 'https://play.railsbank.com'
      }.freeze

      def api_url
        DEFAULTS[:base_url]
      end
    end
  end
end
