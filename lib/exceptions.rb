module Exceptions
  class UnallowedRole < StandardError
    def initialize(role)
      @role = role 
    end 

    def message
      I18n.t('exceptions.unallowed_role', role: @role)
    end
  end

  class InvalidCredentials < StandardError
    def message
      I18n.t('exceptions.invalid_credentials')
    end
  end

  class InvalidAuthenticationType < StandardError
    def message
      I18n.t('exceptions.invalid_authentication_type')
    end
  end
end
