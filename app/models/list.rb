class List < ApplicationRecord
  belongs_to :user

  has_many :list_members
  has_many :tables, through: :list_members
end
