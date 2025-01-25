class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include ErrorHandling
  rescue_from ActiveRecord::ConnectionNotEstablished, with: :handle_db_connection_error
  rescue_from ActiveRecord::StatementInvalid, with: :handle_db_statement_error

  private

end
