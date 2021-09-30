class ListMember < ApplicationRecord
  include PublicActivity::Common

  belongs_to :list
  belongs_to :table
end
