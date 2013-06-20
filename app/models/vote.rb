class Vote < ActiveRecord::Base
  attr_accessible :workitem_id, :user_id
  belongs_to :user
  belongs_to :workitem
end
