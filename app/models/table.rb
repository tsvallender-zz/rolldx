class Table < ApplicationRecord
  belongs_to :user
  has_many :rows, dependent: :destroy
end
