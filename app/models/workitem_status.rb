class WorkitemStatus < ActiveRecord::Base
  attr_accessible :name

  def self.all_cached
    Rails.cache.fetch("WorkitemStatus.all") { all }
  end
end
