class Info < ActiveRecord::Base
  attr_accessible :wage, :wife, :user_id

  belongs_to :user
end
