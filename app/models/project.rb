class Project < ActiveRecord::Base
  attr_accessible :name, :description, :url
  
  validates :name, :presence => true
end
