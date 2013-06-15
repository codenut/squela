class Watch < ActiveRecord::Base
  attr_accessible :user_id, :workitem_id
  belongs_to :user
  belongs_to :workitem
end
