class SessionsController < ApplicationController
  rescue_from Exceptions::InvalidAuthenticationType, with: :if_auth_error
  rescue_from Exceptions::InvalidCredentials, with: :if_auth_error

  def create
    auth = Authentication.new(params.require(:credentials), params[:type])
    auth.create_session
    render json: auth.token, status: :ok
  end

  def destroy
    authenticate_with_http_token do |key, options|
      token = Token.find_by(secret: key)
      if token
        token.destroy
        render json: token, status: :ok 
      else
        raise Exceptions::TokenNotFound
      end 
    end 
  end

  private
  def if_auth_error(exception)
    render json: {auth_error: exception.message}, status: :unprocessable_entity
  end
end
