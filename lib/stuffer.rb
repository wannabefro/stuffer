require "stuffer/version"
require 'capybara'
require 'pry'

module Stuffer
  attr_reader :factory_fields, :capy_fields

  def self.factorize factory
    @factory_fields = FactoryGirl.attributes_for(factory)
    @factory_fields
  end

  def self.get_fields page
    @capy_fields = []
    Capybara.visit page
    @factory_fields.keys.each do |field|
      if Capybara.page.find_field(field.capitalize)
        @capy_fields << field
      end
    end
    @capy_fields
  end




end
