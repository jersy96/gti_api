module Exceptions
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

  class TokenNotFound < StandardError
    def message
      I18n.t('exceptions.token_not_found')
    end
  end
end
