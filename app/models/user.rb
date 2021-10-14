class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :username,
            presence: true,
            length: { maximum: 20 },
            format: { with: /\A[\w_-]+\z/i }
  
  has_many :tables, dependent: :destroy
  has_many :lists, dependent: :destroy

  has_many :f_followers, class_name: 'Follow', foreign_key: "following_id"
  has_many :f_following, class_name: 'Follow', foreign_key: "follower_id"

  has_many :followers, through: 'f_followers', source: 'follower'
  has_many :following, through: 'f_following', source: 'following'
  
  def to_param
    username
  end

  def activity_feed
    PublicActivity::Activity.where(owner: following)
  end
end
