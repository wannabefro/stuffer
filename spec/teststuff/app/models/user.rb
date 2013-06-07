class User < ActiveRecord::Base
  attr_accessible :email, :name, :number, :stuffed, :food, :info_attributes
  has_one :info
  accepts_nested_attributes_for :info
end
