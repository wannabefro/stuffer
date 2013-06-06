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
    @capy_fields = {}
    Capybara.visit page
    @factory_fields.keys.each do |field|
      if Capybara.page.find_field(field.capitalize)
        @capy_fields[field] = Capybara.page.find_field(field.capitalize).tag_name
      end
    end
    @capy_fields
  end

  def self.fill name
    if @factory_fields.keys.include?(name) && @capy_fields[name] == 'input'
      Capybara.fill_in name.capitalize, with: @factory_fields[name]
    end
  end

  def self.select selection
    if @factory_fields.keys.include?(selection) && @capy_fields[selection] == 'select'
      Capybara.select(@factory_fields[selection], from: @factory_fields.key(@factory_fields[selection]).capitalize)
    end
  end



end
