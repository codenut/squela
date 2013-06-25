class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_detail
  has_many :projects

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_detail_attributes
  accepts_nested_attributes_for :user_detail

  def self.search_user_watch(workitem_id, keyword)
    join = sanitize_sql_array(["INNER JOIN user_details ON user_details.user_id = users.id 
                                LEFT JOIN watches ON watches.user_id = users.id and workitem_id = ?", "#{workitem_id}"])
    where = ["user_details.fullname like ? and watches.id IS ?", "%#{keyword}%", nil]
    User.joins(join).where(where).select("users.id, user_details.fullname, users.email")
  end

end
