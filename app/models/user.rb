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

  has_many :followers, class_name: "User", foreign_key: "following_id"
  has_many :following, class_name: "User", foreign_key: "follower_id"
  
  def to_param
    username
  end
end
