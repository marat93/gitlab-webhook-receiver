# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize_request

  def authorize_request
  end
end
