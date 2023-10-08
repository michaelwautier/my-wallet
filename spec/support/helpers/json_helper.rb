# frozen_string_literal: true

module Requests
  # helper for parsing JSON responses
  module JsonHelper
    def json
      @json ||= begin
        JSON.parse(response.body, symbolize_names: true)
      rescue StandardError
        response.body
      end
    end
  end
end

RSpec.configure do |config|
  config.include Requests::JsonHelper, type: :request
end
