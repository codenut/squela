class User < ActiveRecord::Base
  attr_accessible :email, :password, :fullname
  has_many :comments
  has_many :workitems
  has_many :votes
  
  validates :email, :presence => true
  validates :fullname, :presence => true
end
