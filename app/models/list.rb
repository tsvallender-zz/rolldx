class List < ApplicationRecord
  include PublicActivity::Common

  belongs_to :user

  has_many :list_members, dependent: :destroy
  has_many :tables, through: :list_members
end
