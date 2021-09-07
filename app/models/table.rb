class Table < ApplicationRecord
  belongs_to :user
  has_many :rows, dependent: :destroy, inverse_of: :table
  accepts_nested_attributes_for :rows, allow_destroy: true, reject_if: :all_blank
end
