module Exceptions
  class UnallowedRole < StandardError
    def initialize(role)
      @role = role 
    end 

    def message
      I18n.t('exceptions.unallowed_role', role: @role)
    end
  end
end
