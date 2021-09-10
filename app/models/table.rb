class Table < ApplicationRecord
  belongs_to :user
  has_many :rows, dependent: :destroy, inverse_of: :table
  accepts_nested_attributes_for :rows, allow_destroy: true, reject_if: :all_blank
  has_many :list_members
  has_many :lists, through: :list_members
end
