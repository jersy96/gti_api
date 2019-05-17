class TokenSerializer < ApplicationSerializer
  attributes :secret, :user

  def user
    UserSerializer.new(object.user).as_json[:user]
  end
end
