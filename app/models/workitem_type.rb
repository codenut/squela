class WorkitemType < ActiveRecord::Base
  attr_accessible :name

  def self.all_cached
    Rails.cache.fetch("WorkitemType.all") { all }
  end
end
