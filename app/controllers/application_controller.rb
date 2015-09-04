class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # This is not very secure, but will allow any requests marked with 'application/json'
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
end
