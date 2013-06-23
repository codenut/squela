class UserDetail < ActiveRecord::Base
  attr_accessible :user_id, :fullname
  has_many :comments
  has_many :workitems
  has_many :votes
  has_many :watches

  validates :fullname, :presence => true
  belongs_to :user

  def self.search_user_watch(workitem_id, keyword)
    join = sanitize_sql_array ["LEFT JOIN watches ON watches.user_id = 
                                  users.id and workitem_id = ?", "#{workitem_id}"]
                                  where = ["fullname like ? and watches.id IS ?", "%#{keyword}%", nil]
                                  User.joins(join)
                                  .where(where)
                                  .select("users.id, fullname, email")
  end

end
