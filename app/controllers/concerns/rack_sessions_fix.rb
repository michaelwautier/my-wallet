# frozen_string_literal: true

# RackSessionsFix
module RackSessionsFix
  extend ActiveSupport::Concern

  # FakeRackSession class
  class FakeRackSession < Hash
    def enabled?
      false
    end

    def destroy; end
  end

  included do
    before_action :set_fake_sessions

    private

    def set_fake_sessions
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
