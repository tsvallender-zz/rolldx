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

  def to_param
    username
  end
end
