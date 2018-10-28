class TokenSerializer < ApplicationSerializer
  attributes :secret, :user_type

  def user_type
    object.user.type.underscore
  end
end
