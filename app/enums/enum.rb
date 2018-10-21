module Enum
  def self.included(base)
    base.extend(ClassMethods)
  end 

  module ClassMethods
    def define(key, value)
      @hash ||= {}
      @hash[key] = value
    end 

    def const_missing(key)
      @hash[key] if @hash[key]
    end 

    def each
      @hash.each do |key, value|
        yield key, value
      end 
    end 

    def all 
      @hash.values
    end 

    def keys
      @hash.keys
    end 

    def all_to_hash
      h = {}
      each do |key, value|
        h[key] = value
      end 
      h   
    end 
  end 
end
