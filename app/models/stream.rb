class Stream < ActiveRecord::Base
  attr_accessible :json_object, :user_id, :project_id, :description
  def self.add(json, project_id)
    self.create :json_object => json, :project_id => project_id, :user_id => User.current_user.id
  end
end
