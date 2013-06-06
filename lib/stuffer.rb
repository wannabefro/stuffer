require "stuffer/version"
require 'capybara'
require 'pry'

module Stuffer
  attr_reader :factory_fields, :capy_fields

  def self.factorize factory
    @id = []
    @factory_convert = "#{factory.to_s.downcase}_"
    @factory_fields = FactoryGirl.attributes_for(factory)
    @factory_fields.keys.each do |key|
      @id << "#{@factory_convert + key.to_s}"
    end
  end

  def self.get_fields page
    @capy_fields = {}
    Capybara.visit page
    @id.each do |field|
      if Capybara.page.find_field(field)
        @capy_fields[field] = Capybara.page.find_field(field).tag_name
      end
    end
    @capy_fields
  end

  def self.fill name
    if @factory_fields.keys.include?(name) && @capy_fields["#{@factory_convert+name.to_s}"] == 'input'
      Capybara.fill_in "#{@factory_convert+name.to_s}", with: @factory_fields[name]
    end
  end

  def self.select selection
    if @factory_fields.keys.include?(selection) && @capy_fields["#{@factory_convert+selection.to_s}"] == 'select'
      Capybara.select(@factory_fields[selection], from: "#{@factory_convert+selection.to_s}")
    end
  end

  def self.check checkbox
    if @factory_fields.keys.include?(checkbox) && @capy_fields["#{@factory_convert+checkbox.to_s}"] == 'input'
      Capybara.check("#{@factory_convert+checkbox.to_s}")
    end
  end



end
