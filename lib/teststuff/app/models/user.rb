class User < ActiveRecord::Base
  attr_accessible :email, :name, :number, :stuffed, :food
end
