class Table < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
                  against: { title: 'A', description: 'B' },
                  using: {
                    tsearch: {
                      dictionary: 'english',
                      any_word: true
                    }}
  
  include PublicActivity::Common

  belongs_to :die

  belongs_to :user
  has_many :rows, dependent: :destroy, inverse_of: :table
  accepts_nested_attributes_for :rows, allow_destroy: true, reject_if: :all_blank
  has_many :list_members, dependent: :destroy
  has_many :lists, through: :list_members
end
