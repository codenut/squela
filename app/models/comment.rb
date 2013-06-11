class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :workitem
  attr_accessible :description 

  validates :description, :presence => true
end
