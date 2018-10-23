class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  rescue_from Exceptions::TokenNotFound, with: :if_token_not_found

  before_action :set_current_user

  private
  def set_current_user
    authenticate_with_http_token do |key, options|
      token = Token.find_by(secret: key)
      @current_user = token.user if token
    end
    raise Exceptions::TokenNotFound unless @current_user
  end

  def if_token_not_found(exception)
    render json: {token: exception.message}, status: :unprocessable_entity
  end
end
