class Project < ActiveRecord::Base
  belongs_to :user 
  attr_accessible :name, :description, :url

  has_many :workitems
  validates :name, :presence => true
end
