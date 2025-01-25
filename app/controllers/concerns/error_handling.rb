module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::ConnectionNotEstablished, with: :handle_db_connection_error
    rescue_from ActiveRecord::StatementInvalid, with: :handle_db_statement_error
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private
    def handle_db_connection_error(exception)
      Rails.logger.error "Ошибка подключения к базе данных: #{exception.message}"
      render file: 'public/db_error.html', status: :service_unavailable, layout: false
    end

    def handle_db_statement_error(exception)
      Rails.logger.error "Ошибка выполнения SQL-запроса: #{exception.message}"
      render file: 'public/db_error.html', status: :internal_server_error, layout: false
    end


    def not_found(exception)
      logger.warn(exception)
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
