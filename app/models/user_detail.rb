class UserDetail < ActiveRecord::Base
  attr_accessible :user_id, :fullname
  has_many :comments
  has_many :workitems
  has_many :votes
  has_many :watches

  validates :fullname, :presence => true
  belongs_to :user

end
