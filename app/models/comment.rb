class Comment < ActiveRecord::Base
  attr_accessible :description,
                  :workitem_id

  belongs_to :user
  belongs_to :workitem

  validates :description, :presence => true
end
