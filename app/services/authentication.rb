class Authentication
  # Attributes
  attr_reader :user, :token

  # Builder
  def initialize(credentials, type='simple')
    type ||= 'simple'
    @credentials = credentials
    @type = type
  end

  def create_session
    @user = find_user 
    @token = Token.create(user: @user) if @user.present?
  end

  private
  def find_user
    case @type
    when 'simple'
      simple_login
    else
      raise Exceptions::InvalidAuthenticationType
    end   
  end

  def simple_login
    user = User.find_by(email: @credentials[:email]) if @credentials[:email]
    user = user.authenticate(@credentials[:password]) if user
    raise Exceptions::InvalidCredentials unless user
    user
  end
end
