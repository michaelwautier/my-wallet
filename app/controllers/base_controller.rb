# frozen_string_literal: true

# Base controller for the application
class BaseController < ApplicationController
  before_action :authenticate_user!
end
