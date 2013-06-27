class Workitem < ActiveRecord::Base
  attr_accessible :summary, 
                  :workitem_type_id, 
                  :points, 
                  :workitem_status_id, 
                  :priority_id, 
                  :user_id,
                  :estimate,
                  :description,
                  :tags,
                  :due_date

  has_many :comments
  has_many :votes
  has_many :watches
  
  belongs_to :priority
  belongs_to :workitem_status
  belongs_to :workitem_type
  belongs_to :user
  validates :summary, :presence => true
end
