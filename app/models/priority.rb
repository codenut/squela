class Priority < ActiveRecord::Base
  attr_accessible :name

  def self.all_cached 
    Rails.cache.fetch('Priority.all') { all }
  end
end
