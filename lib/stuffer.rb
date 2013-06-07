require "stuffer/version"
require 'capybara'
require 'pry'

module Stuffer
  attr_reader :factory_fields, :capy_fields

  def self.factorize (factory, nest_factory=nil)
    @factory = factory
    @id = []
    @factory_convert = "#{@factory.to_s.downcase}_"
    @factory_fields = FactoryGirl.attributes_for(factory)
    @factory_fields.keys.each do |key|
      @id << "#{@factory_convert + key.to_s}"
    end
    if nest_factory
      get_nested nest_factory
    end
    super_field
    get_fields
  end

  def self.super_field
    @fields = {}
    counter = 0
    if @nested_fields
      @stuffer = @factory_fields.merge(@nested_fields)
    else
      @stuffer = @factory_fields
    end
    @stuffer.values.each do |value|
      @fields[@id[counter]] = value
      counter += 1
    end
  end

  def self.get_nested nest
    @nest = nest
    @nested_fields = FactoryGirl.attributes_for(nest)
    @nested_fields.keys.each do |key|
      @id << "#{@factory_convert+nest.to_s}_attributes_#{key.to_s}"
    end
  end

  def self.get_fields
    @capy_fields = {}
    Capybara.visit Capybara.current_url
    @id.each do |field|
      begin
        Capybara.page.find_field(field)
      rescue
        false
      else
        @capy_fields[field] = Capybara.page.find_field(field).tag_name
      end
    end
    @capy_fields
  end

  def self.convert symbol
    if !@nested_fields
      symbol_field = "#{@factory_convert+symbol.to_s}"
      if @fields.keys.include?(symbol_field)
        symbol = symbol_field
        symbol
      end
    else
      symbol_field = "#{@factory_convert+symbol.to_s}"
      symbol_nest = "#{@factory_convert+@nest.to_s}_attributes_#{symbol.to_s}"
      if @fields.keys.include?(symbol_field)
        symbol = symbol_field
        symbol
      elsif @fields.keys.include?(symbol_nest)
        symbol = symbol_nest
        symbol
      end
    end
  end

  def self.fill name
    if name.is_a? Symbol
      name = convert name
    end
    if @id.include?(name) && @capy_fields[name] == 'input'
      Capybara.fill_in name, with: @fields[name]
    end
  end

  def self.select selection
    if selection.is_a? Symbol
      selection = convert selection
    end
    if @id.include?(selection) && @capy_fields[selection] == 'select'
      Capybara.select @fields[selection], from: selection
    end
  end

  def self.check checkbox
    if checkbox.is_a? Symbol
      checkbox = convert checkbox
    end
    if @id.include?(checkbox) && @capy_fields[checkbox] == 'input'
      Capybara.check checkbox
    end
  end

  def self.radio value
    if value.is_a? Symbol
      value = convert value
    end
    if @id.include? value
      Capybara.choose("#{value}_#{@fields[value]}")
    end
  end

  def self.stuff
    @id.each do |stuff|
      if @capy_fields[stuff] == 'input' && @fields[stuff] != false && @fields[stuff] != true
        fill stuff
      elsif @capy_fields[stuff] == 'input'
        check stuff
      elsif @capy_fields[stuff] == 'select'
        select stuff
      else
        begin
          radio stuff
        rescue
          false
        else
          true
        end
      end
    end
  end



end
