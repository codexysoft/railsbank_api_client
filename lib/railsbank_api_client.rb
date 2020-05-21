# frozen_string_literal: true

require 'railsbank_api_client/version'
require 'faraday_middleware'
require 'hashie'
require 'railsbank_api_client/connection'
require 'railsbank_api_client/middleware/config'
require 'railsbank_api_client/request_helper'
require 'railsbank_api_client/beneficiary'

module RailsbankApiClient
  class << self
    attr_reader :api, :config

    def configure
      @config = RailsbankApiClient::Middleware::Config.new.tap { |h| yield(h) }
      @api = RailsbankApiClient::Connection.build(@config)
    end
  end
end
