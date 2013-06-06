class User < ActiveRecord::Base
  attr_accessible :email, :name, :number
end
