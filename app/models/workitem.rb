class Workitem < ActiveRecord::Base
  attr_accessible :summary, 
                  :type_id, 
                  :points, 
                  :status_id, 
                  :priority_id, 
                  :user_id,
                  :estimate,
                  :tags,
                  :due_date

  has_many :comments
  has_many :votes
  has_many :watches

  belongs_to :user
  validates :summary, :presence => true
end
