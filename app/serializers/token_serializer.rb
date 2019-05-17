class TokenSerializer < ApplicationSerializer
  attributes :secret, :user

  def user
    u = object.user
    if u.instance_of?(Tutor)
      TutorSerializer.new(u).as_json[:tutor].merge({type: :tutor})
    else
      StudentSerializer.new(u).as_json[:student].merge({type: :student})
    end
  end
end
