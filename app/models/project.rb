class Project < ActiveRecord::Base
  belongs_to :user 
  attr_accessible :name, :description, :url
  validates :name, :presence => true
end
