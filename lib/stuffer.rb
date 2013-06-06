require "stuffer/version"

module Stuffer
  def self.factorize factory
    FactoryGirl.attributes_for(factory)
  end
end
