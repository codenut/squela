class User < ActiveRecord::Base
  attr_accessible :email, :password, :fullname
  has_many :comments
  
  validates :email, :presence => true
  validates :fullname, :presence => true
end
